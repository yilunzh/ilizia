require 'rest-client'
require 'pry'

class PersonEmailSearch < ApplicationRecord
	has_many :domain_email_formats

	def search_valid_emails
		email_addresses = generate_email_addresses
		validate_emails(email_addresses)
	end

	def generate_email_addresses
		
		#email_addresses = { "fn.ln@domain_url": "#{first_name}.#{last_name}@#{domain_url}"}
		return {"fn@domain_url": "#{first_name}@#{domain_url}"}
		
	end

	def validate_emails(email_addresses)
		email_addresses.each do |email_format, email_address|
			url = "https://api.zerobounce.net/v1/validate"
			apikey = "e79691a064b44060be01c82cb6ad3af3"
			email = email_address
			 
			params = {"email": "valid@example.com", "apikey": apikey}
			 
			# Uncomment to use the optional API with IP Lookup
			# params["ipaddress"] = ipaddress
			 
			response = JSON.parse(RestClient.get url, {params: params})
			
		end
	end
end
