json.extract! domain_format, :id, :domain_url, :format, :status, :score, :created_at, :updated_at
json.url domain_format_url(domain_format, format: :json)
