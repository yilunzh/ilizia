require 'rest-client'
require 'pry'

class PersonEmailSearch < ApplicationRecord
	has_many :domain_email_formats

	def search_valid_emails
		email_addresses = generate_email_addresses
		results = validate_emails(email_addresses)

		return results
	end

	def generate_email_addresses
		
		return { "fn.ln@domain_url": "#{first_name}.#{last_name}@#{domain_url}",
						 "fn@domain_url": "#{first_name}@#{domain_url}"}
	end

	def validate_emails(email_addresses)
		results = {}
		email_addresses.each do |email_format, email_address|
			url = "https://api.zerobounce.net/v1/validate"
			apikey = "e79691a064b44060be01c82cb6ad3af3"
			email = email_address
			 
			params = {"email": email_address, "apikey": apikey}
			 
			# Uncomment to use the optional API with IP Lookup
			# params["ipaddress"] = ipaddress
			 
			response = JSON.parse(RestClient.get url, {params: params})
			results[email_format] = response["status"]
		end

		return results
	end
end
