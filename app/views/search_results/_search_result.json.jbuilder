json.extract! search_result, :id, :email_format, :email_address, :status, :sub_status, :account, 
														 :domain, :disposable, :toxic, :firstname, :lastname, :gender, :location, :created_at, :updated_at
json.url search_result_url(search_result, format: :json)
