json.extract! domain, :id, :domain_url, :company_name, :created_at, :updated_at
json.url domain_url(domain, format: :json)
