json.extract! search_result, :id, :email_format, :email_address, :status, :created_at, :updated_at
json.url search_result_url(search_result, format: :json)
