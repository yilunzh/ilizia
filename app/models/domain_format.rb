class DomainFormat < ApplicationRecord
	has_and_belongs_to_many :person_searches, :join_table => :person_searches_domain_formats

	def self.search_url(domain_url)
		where(domain_url: domain_url)
	end

	def self.search_domain_format(domain_url, email_format)
		where(domain_url: domain_url, format: email_format)
	end
end
