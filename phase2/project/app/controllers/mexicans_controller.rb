class MexicansController < ApplicationController
  before_action :set_mexican, only: [:show, :edit, :update, :destroy]

  # GET /mexicans
  # GET /mexicans.json
  def index
    @mexicans = Mexican.all
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
      if mp.foodtype == 'Mexican'
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
  # GET /mexicans/1
  # GET /mexicans/1.json
  def show
  end

  # GET /mexicans/new
  def new
    @mexican = Mexican.new
  end

  # GET /mexicans/1/edit
  def edit
  end

  # POST /mexicans
  # POST /mexicans.json
  def create
    @mexican = Mexican.new(mexican_params)

    respond_to do |format|
      if @mexican.save
        format.html { redirect_to @mexican, notice: 'Mexican was successfully created.' }
        format.json { render :show, status: :created, location: @mexican }
      else
        format.html { render :new }
        format.json { render json: @mexican.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mexicans/1
  # PATCH/PUT /mexicans/1.json
  def update
    respond_to do |format|
      if @mexican.update(mexican_params)
        format.html { redirect_to @mexican, notice: 'Mexican was successfully updated.' }
        format.json { render :show, status: :ok, location: @mexican }
      else
        format.html { render :edit }
        format.json { render json: @mexican.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mexicans/1
  # DELETE /mexicans/1.json
  def destroy
    @mexican.destroy
    respond_to do |format|
      format.html { redirect_to mexicans_url, notice: 'Mexican was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mexican
      @mexican = Mexican.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mexican_params
      params[:mexican]
    end
end
