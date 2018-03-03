class DomainFormatsController < ApplicationController
  before_action :set_domain_format, only: [:show, :edit, :update, :destroy]

  # GET /domain_formats
  # GET /domain_formats.json
  def index
    @domain_formats = DomainFormat.all
  end

  # GET /domain_formats/1
  # GET /domain_formats/1.json
  def show
  end

  # GET /domain_formats/new
  def new
    @domain_format = DomainFormat.new
  end

  # GET /domain_formats/1/edit
  def edit
  end

  # POST /domain_formats
  # POST /domain_formats.json
  def create
    @domain_format = DomainFormat.new(domain_format_params)

    respond_to do |format|
      if @domain_format.save
        format.html { redirect_to @domain_format, notice: 'Domain format was successfully created.' }
        format.json { render :show, status: :created, location: @domain_format }
      else
        format.html { render :new }
        format.json { render json: @domain_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domain_formats/1
  # PATCH/PUT /domain_formats/1.json
  def update
    respond_to do |format|
      if @domain_format.update(domain_format_params)
        format.html { redirect_to @domain_format, notice: 'Domain format was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain_format }
      else
        format.html { render :edit }
        format.json { render json: @domain_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_formats/1
  # DELETE /domain_formats/1.json
  def destroy
    @domain_format.destroy
    respond_to do |format|
      format.html { redirect_to domain_formats_url, notice: 'Domain format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain_format
      @domain_format = DomainFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_format_params
      params.require(:domain_format).permit(:domain_url, :format, :status, :score)
    end
end
