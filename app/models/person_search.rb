require 'rest-client'
require 'pry'

class PersonSearch < ApplicationRecord
	has_and_belongs_to_many :domain_formats, :join_table => :person_searches_domain_formats

	def search_valid_email
		domain_formats = search_existing_domain_formats

		results = {}

		if domain_formats.empty?
			email_addresses = generate_email_addresses
			results = validate_emails(email_addresses)
		else
			domain_formats.each do |record|
				results[record.format] = record.status
			end

		end

		return results
	end

	def search_existing_domain_formats
		return DomainFormat.search(domain_url)
	end

	def generate_email_addresses
		
		return { 
						 #{}"fn.ln@domain_url": "#{first_name}.#{last_name}@#{domain_url}",
						 "fn@domain_url": "#{first_name}@#{domain_url}"
						}
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
