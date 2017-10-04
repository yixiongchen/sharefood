class FrenchesController < ApplicationController
  before_action :set_french, only: [:show, :edit, :update, :destroy]

  # GET /frenches
  # GET /frenches.json
  def index
    @frenches = French.all
    @microposts = Micropost.all
    if params[:status]
      a = Micropost.find(params[:status])
      a.status = a.status - 1
      a.save
      @user = current_user
      @user.update_attribute(:list_of_micropost_id, @user.list_of_micropost_id << a.id)
      a.update_attribute(:list_of_user_id, a.list_of_user_id << @user.id)
      a.save
      @user.save
      
    end
    if logged_in?
      @user = current_user
      @user_post_id = @user.id
      @user_list_of_micropost_id = @user.list_of_micropost_id
      @reserve_id = []
      for micropost in Micropost.all
        if  not @user.list_of_micropost_id.include?(micropost.id)
          @reserve_id.push(micropost.id)
        end
      end
    else
      @reserve_id = []
      @user_list_of_micropost_id = []
      @user = current_user
      @user_post_id = 0
    end
    
    @location = []
    @user_id = []
    @content = []
    @foodtype = []
    for mp in Micropost.all
      if mp.foodtype == 'French'
        @location.push(mp.location)
        @content.push(mp.content)
        @user_id.push(mp.user_id)
        @foodtype.push(mp.foodtype)
      end
    end
    
    @user_name = []
    if @user_id != []
      for id in @user_id
        @user_name.push((User.find(id)).name)
      end
    end
  end

  # GET /frenches/1
  # GET /frenches/1.json
  def show
  end

  # GET /frenches/new
  def new
    @french = French.new
  end

  # GET /frenches/1/edit
  def edit
  end

  # POST /frenches
  # POST /frenches.json
  def create
    @french = French.new(french_params)

    respond_to do |format|
      if @french.save
        format.html { redirect_to @french, notice: 'French was successfully created.' }
        format.json { render :show, status: :created, location: @french }
      else
        format.html { render :new }
        format.json { render json: @french.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frenches/1
  # PATCH/PUT /frenches/1.json
  def update
    respond_to do |format|
      if @french.update(french_params)
        format.html { redirect_to @french, notice: 'French was successfully updated.' }
        format.json { render :show, status: :ok, location: @french }
      else
        format.html { render :edit }
        format.json { render json: @french.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frenches/1
  # DELETE /frenches/1.json
  def destroy
    @french.destroy
    respond_to do |format|
      format.html { redirect_to frenches_url, notice: 'French was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_french
      @french = French.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def french_params
      params[:french]
    end
end
