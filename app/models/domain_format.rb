require 'pry'

class DomainFormat < ApplicationRecord
	has_and_belongs_to_many :person_searches, :join_table => :person_searches_domain_formats

	def self.search_url(domain_url)
		where(domain_url: domain_url)
	end

	def self.search_domain_format(domain_url, email_format)
		where(domain_url: domain_url, format: email_format)
	end

	def generate_or_update_score_on_status(status)
		case status.downcase
		when "valid"
			self.score += 1
			self.upvote_count += 1
		when "invalid"
			self.score -= 1
			self.downvote_count += 1
		else
		end
		
		self.assign_attributes(score: score, upvote_count: upvote_count, downvote_count: downvote_count)
	end 
end
