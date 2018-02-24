class EmailFormatsController < ApplicationController
  before_action :set_email_format, only: [:show, :edit, :update, :destroy]

  # GET /email_formats
  # GET /email_formats.json
  def index
    @email_formats = EmailFormat.all
  end

  # GET /email_formats/1
  # GET /email_formats/1.json
  def show
  end

  # GET /email_formats/new
  def new
    @email_format = EmailFormat.new
  end

  # GET /email_formats/1/edit
  def edit
  end

  # POST /email_formats
  # POST /email_formats.json
  def create
    @email_format = EmailFormat.new(email_format_params)

    respond_to do |format|
      if @email_format.save
        format.html { redirect_to @email_format, notice: 'Email format was successfully created.' }
        format.json { render :show, status: :created, location: @email_format }
      else
        format.html { render :new }
        format.json { render json: @email_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_formats/1
  # PATCH/PUT /email_formats/1.json
  def update
    respond_to do |format|
      if @email_format.update(email_format_params)
        format.html { redirect_to @email_format, notice: 'Email format was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_format }
      else
        format.html { render :edit }
        format.json { render json: @email_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_formats/1
  # DELETE /email_formats/1.json
  def destroy
    @email_format.destroy
    respond_to do |format|
      format.html { redirect_to email_formats_url, notice: 'Email format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_format
      @email_format = EmailFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_format_params
      params.require(:email_format).permit(:domain_id, :format, :valid, :status, :score)
    end
end
