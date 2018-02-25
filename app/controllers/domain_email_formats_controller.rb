class DomainEmailFormatsController < ApplicationController
  before_action :set_domain_email_format, only: [:show, :edit, :update, :destroy]

  # GET /domain_email_formats
  # GET /domain_email_formats.json
  def index
    @domain_email_formats = DomainEmailFormat.all
  end

  # GET /domain_email_formats/1
  # GET /domain_email_formats/1.json
  def show
  end

  # GET /domain_email_formats/new
  def new
    @domain_email_format = DomainEmailFormat.new
  end

  # GET /domain_email_formats/1/edit
  def edit
  end

  # POST /domain_email_formats
  # POST /domain_email_formats.json
  def create
    @domain_email_format = DomainEmailFormat.new(domain_email_format_params)

    respond_to do |format|
      if @domain_email_format.save
        format.html { redirect_to @domain_email_format, notice: 'Domain email format was successfully created.' }
        format.json { render :show, status: :created, location: @domain_email_format }
      else
        format.html { render :new }
        format.json { render json: @domain_email_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domain_email_formats/1
  # PATCH/PUT /domain_email_formats/1.json
  def update
    respond_to do |format|
      if @domain_email_format.update(domain_email_format_params)
        format.html { redirect_to @domain_email_format, notice: 'Domain email format was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain_email_format }
      else
        format.html { render :edit }
        format.json { render json: @domain_email_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domain_email_formats/1
  # DELETE /domain_email_formats/1.json
  def destroy
    @domain_email_format.destroy
    respond_to do |format|
      format.html { redirect_to domain_email_formats_url, notice: 'Domain email format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain_email_format
      @domain_email_format = DomainEmailFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_email_format_params
      params.require(:domain_email_format).permit(:format, :confirmed, :status, :score)
    end
end
