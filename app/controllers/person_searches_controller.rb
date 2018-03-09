require 'pry'

class PersonSearchesController < ApplicationController
  before_action :set_person_search, only: [:show, :edit, :update, :destroy]

  # GET /person_searches
  # GET /person_searches.json
  def index
    @person_searches = PersonSearch.all
  end

  # GET /person_searches/1
  # GET /person_searches/1.json
  def show
    @domain_formats = @person_search.domain_formats
    @search_results = @person_search.search_results
    #binding.pry
  end

  # GET /person_searches/new
  def new
    @person_search = PersonSearch.new
  end

  # GET /person_searches/1/edit
  def edit
  end

  # POST /person_searches
  # POST /person_searches.json
  def create
    @person_search = PersonSearch.new(person_search_params)

    respond_to do |format|
      if @person_search.save
        
        existing_domain = @person_search.search_existing_domain
        @search_results = @person_search.search_valid_email(existing_domain)

        if existing_domain.empty?
          @person_search.create_new_domain_formats(@search_results, person_search_params[:domain_url])
        else
          @search_results.each do |email_format, result|

            existing_domain_format = @person_search.search_existing_domain_format(person_search_params[:domain_url], email_format)
            if existing_domain_format.empty?
              @person_search.create_new_domain_format(person_search_params[:domain_url], email_format)
            else
              @person_search.associate_exisitng_domain_format(existing_domain_format)
            end
            existing_domain_format[0].generate_or_update_score_on_status(result[:status])
            existing_domain_format[0].save
          end  
        end

        format.html { redirect_to @person_search, notice: 'Person search was successfully created.' }
        format.json { render :show, status: :created, location: @person_search }
      else
        format.html { render :new }
        format.json { render json: @person_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_searches/1
  # PATCH/PUT /person_searches/1.json
  def update
    respond_to do |format|
      if @person_search.update(person_search_params)
        format.html { redirect_to @person_search, notice: 'Person search was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_search }
      else
        format.html { render :edit }
        format.json { render json: @person_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_searches/1
  # DELETE /person_searches/1.json
  def destroy
    @person_search.destroy
    respond_to do |format|
      format.html { redirect_to person_searches_url, notice: 'Person search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_search
      @person_search = PersonSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_search_params
      params.require(:person_search).permit(:first_name, :last_name, :domain_url)
    end
end
