class CanadianpostsController < ApplicationController
  before_action :set_canadianpost, only: [:show, :edit, :update, :destroy]

  # GET /canadianposts
  # GET /canadianposts.json
  def index
    @canadianposts = Canadianpost.all
    @microposts = Micropost.all
  end

  # GET /canadianposts/1
  # GET /canadianposts/1.json
  def show
  end

  # GET /canadianposts/new
  def new
    @canadianpost = Canadianpost.new
  end

  # GET /canadianposts/1/edit
  def edit
  end

  # POST /canadianposts
  # POST /canadianposts.json
  def create
    @canadianpost = Canadianpost.new(canadianpost_params)

    respond_to do |format|
      if @canadianpost.save
        format.html { redirect_to @canadianpost, notice: 'Canadianpost was successfully created.' }
        format.json { render :show, status: :created, location: @canadianpost }
      else
        format.html { render :new }
        format.json { render json: @canadianpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canadianposts/1
  # PATCH/PUT /canadianposts/1.json
  def update
    respond_to do |format|
      if @canadianpost.update(canadianpost_params)
        format.html { redirect_to @canadianpost, notice: 'Canadianpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @canadianpost }
      else
        format.html { render :edit }
        format.json { render json: @canadianpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canadianposts/1
  # DELETE /canadianposts/1.json
  def destroy
    @canadianpost.destroy
    respond_to do |format|
      format.html { redirect_to canadianposts_url, notice: 'Canadianpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canadianpost
      @canadianpost = Canadianpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canadianpost_params
      params.require(:canadianpost).permit(:content, :user_id, :status, :location, :foodtype, :picture, :list_of_user_id)
    end
end
