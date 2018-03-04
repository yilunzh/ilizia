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
        @search_results = @person_search.search_valid_email
        
        existing_domain_formats = @person_search.search_existing_domain_formats

        if existing_domain_formats.empty?
          @search_results.each do |email_format, status|
            @person_search.domain_formats.create(domain_url: person_search_params["domain_url"], 
                                                 format: email_format, status: status, score: 0)
          end
        else
          @person_search.domain_formats << existing_domain_formats
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
