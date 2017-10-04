class ChinesesController < ApplicationController
  before_action :set_chinese, only: [:show, :edit, :update, :destroy]

  # GET /chineses
  # GET /chineses.json
  def index
    @chineses = Chinese.all
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
    @microposts = Micropost.all

    @location = []
    @user_id = []
    @content = []
    @foodtype = []
    for mp in Micropost.all
      if mp.foodtype == 'Chinese'
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

  # GET /chineses/1
  # GET /chineses/1.json
  def show
  end

  # GET /chineses/new
  def new
    @chinese = Chinese.new
  end

  # GET /chineses/1/edit
  def edit
  end

  # POST /chineses
  # POST /chineses.json
  def create
    @chinese = Chinese.new(chinese_params)

    respond_to do |format|
      if @chinese.save
        format.html { redirect_to @chinese, notice: 'Chinese was successfully created.' }
        format.json { render :show, status: :created, location: @chinese }
      else
        format.html { render :new }
        format.json { render json: @chinese.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chineses/1
  # PATCH/PUT /chineses/1.json
  def update
    respond_to do |format|
      if @chinese.update(chinese_params)
        format.html { redirect_to @chinese, notice: 'Chinese was successfully updated.' }
        format.json { render :show, status: :ok, location: @chinese }
      else
        format.html { render :edit }
        format.json { render json: @chinese.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chineses/1
  # DELETE /chineses/1.json
  def destroy
    @chinese.destroy
    respond_to do |format|
      format.html { redirect_to chineses_url, notice: 'Chinese was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chinese
      @chinese = Chinese.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chinese_params
      params.require(:chinese).permit(:name)
    end
end
