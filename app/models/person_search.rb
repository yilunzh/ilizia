require 'rest-client'
require 'pry'

class PersonSearch < ApplicationRecord
	has_and_belongs_to_many :domain_formats, :join_table => :person_searches_domain_formats

	def search_valid_email(existing_domain)
		results = {}
		email_addresses = generate_email_addresses

		if existing_domain.empty?
			results = validate_emails(email_addresses)
		else
			domain_formats.each do |record|
				results[record.format] = record.status
			end
			
			email_addresses.each do |email_format, email_address|
				if not results.key?(email_format)
					results[email_format] = validate_email(email_address)
				end
			end
		end

		return results
	end

	def search_existing_domain
		return DomainFormat.search_url(domain_url)
	end

	def search_existing_domain_format(domain_url, email_format)
		return DomainFormat.search_domain_format(domain_url, email_format)
	end

	def create_new_domain_formats(search_results, domain_url)
    search_results.each do |email_format, status|
    	create_new_domain_format(domain_url, email_format, status)
  	end
	end

	def create_new_domain_format(domain_url, email_format, status)
    	domain_format = self.domain_formats.build(domain_url: domain_url, 
                                 format: email_format, status: status, score: 0, 
                                 upvote_count: 0, downvote_count: 0)
			domain_format.generate_or_update_score_on_status(status)
			self.save
    	# self.domain_formats.create(domain_url: domain_url, 
     #                             format: email_format, status: status, score: score[:score], 
     #                             upvote_count: score[:upvote_count], downvote_count: score[:downvote_count])
	end

	def associate_exisitng_domain_format(existing_domain_format)
		self.domain_formats << existing_domain_format
	end

	def generate_email_addresses
		return { 
						 "fn.ln@domain_url": "#{first_name}.#{last_name}@#{domain_url}",
						 "fn@domain_url": "#{first_name}@#{domain_url}",
						 "fn_ln@domain_url": "#{first_name}_#{last_name}@#{domain_url}",
						 "fn-ln@domain_url": "#{first_name}-#{last_name}@#{domain_url}"
						}
	end

	def validate_emails(email_addresses)
		results = {}
		email_addresses.each do |email_format, email_address|
			results[email_format] = validate_email(email_address)
		end

		return results
	end

	def validate_email(email_address)
		url = "https://api.zerobounce.net/v1/validate"
		apikey = "e79691a064b44060be01c82cb6ad3af3"
		email = email_address
		 
		params = {"email": email_address, "apikey": apikey}
		 
		# Uncomment to use the optional API with IP Lookup
		# params["ipaddress"] = ipaddress
		 
		#response = JSON.parse(RestClient.get url, {params: params})
		#return response["status"]

		result_status = ["valid", "invalid"]
		status = result_status.sample

		return status		
	end

	def format_to_email
	end
end
