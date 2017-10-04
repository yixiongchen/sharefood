class ChinesesController < ApplicationController
  before_action :set_chinese, only: [:show, :edit, :update, :destroy]

  # GET /chineses
  # GET /chineses.json
  def index
    @chineses = Chinese.all
    @microposts = Micropost.all

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
