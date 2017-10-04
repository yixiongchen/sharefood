class JapanesesController < ApplicationController
  before_action :set_japanese, only: [:show, :edit, :update, :destroy]

  # GET /japaneses
  # GET /japaneses.json
  def index
    @japaneses = Japanese.all
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
      if mp.foodtype == 'Japanese'
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

  # GET /japaneses/1
  # GET /japaneses/1.json
  def show
  end

  # GET /japaneses/new
  def new
    @japanese = Japanese.new
  end

  # GET /japaneses/1/edit
  def edit
  end

  # POST /japaneses
  # POST /japaneses.json
  def create
    @japanese = Japanese.new(japanese_params)

    respond_to do |format|
      if @japanese.save
        format.html { redirect_to @japanese, notice: 'Japanese was successfully created.' }
        format.json { render :show, status: :created, location: @japanese }
      else
        format.html { render :new }
        format.json { render json: @japanese.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /japaneses/1
  # PATCH/PUT /japaneses/1.json
  def update
    respond_to do |format|
      if @japanese.update(japanese_params)
        format.html { redirect_to @japanese, notice: 'Japanese was successfully updated.' }
        format.json { render :show, status: :ok, location: @japanese }
      else
        format.html { render :edit }
        format.json { render json: @japanese.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /japaneses/1
  # DELETE /japaneses/1.json
  def destroy
    @japanese.destroy
    respond_to do |format|
      format.html { redirect_to japaneses_url, notice: 'Japanese was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_japanese
      @japanese = Japanese.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def japanese_params
      params[:japanese]
    end
end
