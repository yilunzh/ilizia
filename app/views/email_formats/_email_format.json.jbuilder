json.extract! email_format, :id, :domain_id, :format, :confirmed, :status, :score, :created_at, :updated_at
json.url email_format_url(email_format, format: :json)
