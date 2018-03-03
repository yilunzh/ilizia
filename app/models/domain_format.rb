class DomainFormat < ApplicationRecord
	has_and_belongs_to_many :person_searches, :join_table => :person_searches_domain_formats

	def self.search(domain_url)
		where(domain_url: domain_url)
	end
end
