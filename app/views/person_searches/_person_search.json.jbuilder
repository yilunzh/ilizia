json.extract! person_search, :id, :first_name, :last_name, :domain_url, :created_at, :updated_at
json.url person_search_url(person_search, format: :json)
