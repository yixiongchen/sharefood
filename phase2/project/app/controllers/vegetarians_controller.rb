class VegetariansController < ApplicationController
  before_action :set_vegetarian, only: [:show, :edit, :update, :destroy]

  # GET /vegetarians
  # GET /vegetarians.json
  def index
    @vegetarians = Vegetarian.all
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
      if mp.foodtype == '*Vegetarian'
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
  # GET /vegetarians/1
  # GET /vegetarians/1.json
  def show
  end

  # GET /vegetarians/new
  def new
    @vegetarian = Vegetarian.new
  end

  # GET /vegetarians/1/edit
  def edit
  end

  # POST /vegetarians
  # POST /vegetarians.json
  def create
    @vegetarian = Vegetarian.new(vegetarian_params)

    respond_to do |format|
      if @vegetarian.save
        format.html { redirect_to @vegetarian, notice: 'Vegetarian was successfully created.' }
        format.json { render :show, status: :created, location: @vegetarian }
      else
        format.html { render :new }
        format.json { render json: @vegetarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vegetarians/1
  # PATCH/PUT /vegetarians/1.json
  def update
    respond_to do |format|
      if @vegetarian.update(vegetarian_params)
        format.html { redirect_to @vegetarian, notice: 'Vegetarian was successfully updated.' }
        format.json { render :show, status: :ok, location: @vegetarian }
      else
        format.html { render :edit }
        format.json { render json: @vegetarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vegetarians/1
  # DELETE /vegetarians/1.json
  def destroy
    @vegetarian.destroy
    respond_to do |format|
      format.html { redirect_to vegetarians_url, notice: 'Vegetarian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vegetarian
      @vegetarian = Vegetarian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vegetarian_params
      params[:vegetarian]
    end
end
