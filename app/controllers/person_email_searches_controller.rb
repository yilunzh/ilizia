require 'pry'
class PersonEmailSearchesController < ApplicationController
  before_action :set_person_email_search, only: [:show, :edit, :update, :destroy]

  # GET /person_email_searches
  # GET /person_email_searches.json
  def index
    @person_email_searches = PersonEmailSearch.all
  end

  # GET /person_email_searches/1
  # GET /person_email_searches/1.json
  def show
  end

  # GET /person_email_searches/new
  def new
    @person_email_search = PersonEmailSearch.new
  end

  # GET /person_email_searches/1/edit
  def edit
  end

  # POST /person_email_searches
  # POST /person_email_searches.json
  def create
    @person_email_search = PersonEmailSearch.new(person_email_search_params)

    respond_to do |format|
      if @person_email_search.save
        @search_results = @person_email_search.search_valid_emails
        
        @search_results.each do |email_format, status|
          @person_email_search.domain_email_formats.create(format: email_format, status: status, score: 0)
        end
        
        format.html { redirect_to @person_email_search, notice: 'Person email search was successfully created.' }
        format.json { render :show, status: :created, location: @person_email_search }
      else
        format.html { render :new }
        format.json { render json: @person_email_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_email_searches/1
  # PATCH/PUT /person_email_searches/1.json
  def update
    respond_to do |format|
      if @person_email_search.update(person_email_search_params)
        format.html { redirect_to @person_email_search, notice: 'Person email search was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_email_search }
      else
        format.html { render :edit }
        format.json { render json: @person_email_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_email_searches/1
  # DELETE /person_email_searches/1.json
  def destroy
    @person_email_search.destroy
    respond_to do |format|
      format.html { redirect_to person_email_searches_url, notice: 'Person email search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_email_search
      @person_email_search = PersonEmailSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_email_search_params
      params.require(:person_email_search).permit(:first_name, :last_name, :domain_url)
    end
end
