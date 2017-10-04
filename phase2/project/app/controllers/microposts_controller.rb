class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # GET /microposts
  # GET /microposts.json
  def index
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
    @microposts = Micropost.all

    @location = []
    @user_ids = []
    @content = []
    @foodtype = []
    for mp in Micropost.all
      @location.push(mp.location)
      @content.push(mp.content)
      @user_ids.push(mp.user_id)
      @foodtype.push(mp.foodtype)
    end
    
    @user_names = []
    for id in @user_ids
      @user_names.push((User.find(id)).name)
    end

  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
    @user = current_user
    if params[:cancel]
      @micropost.update_attribute(:status,@micropost.status+1)
      @users_list = @micropost.list_of_user_id
      @users_list.delete(current_user.id)
      @micropost.update_attribute(:list_of_user_id, @users_list)
      @microposts_list = current_user.list_of_micropost_id
      @microposts_list.delete((@micropost.id))
      current_user.update_attribute(:list_of_micropost_id,@microposts_list)
    end
    if @micropost.user_id == nil
      @micropost.update_attribute(:user_id, @user.id)
      @user.update_attribute(:post_id, @user.id)
    end
    if current_user != nil
      if current_user.id == @micropost.user_id
        @label = "Delete |"
        @Edit = "Edit |"
      else
        @label = ""
        @Edit = ""
        @post_user_name = ''
        @post_user_id = ''
      end
    else
        @label = ""
        @Edit = ""
        @post_user_name = ''
        @post_user_id = ''
    
      
    end
    if @micropost.list_of_user_id != []
      @users = []
      for us in @micropost.list_of_user_id
        @users.push(User.find(us))
      end
    else
      @users = []
    end
      @post_user_name = (User.find(@micropost.user_id)).name
      @post_user_id = User.find(@micropost.user_id).id.to_s
    if current_user != nil  
      if @micropost.list_of_user_id.include?(current_user.id)
        @cancel = "Cancel Reservation |"
        @reserve = ""
      else
        @cancel = ''
        @reserve = "Reserve Now!"
      end
    else
      @cancel = ''
      @reserve =''
    end
  end
  
  def loginuser
    @microposts = Micropost.all
   
  end

  # GET /microposts/new
  def new
    @user = current_user
    @micropost = Micropost.new
    if params[:foodtype]
      @micropost.update_attribute(:foodtype,  params[:foodtype])
    end
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts
  # POST /microposts.json
  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:title, :content, :user_id, :status, :location, :foodtype, :picture)
    end
end
