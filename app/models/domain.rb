class Domain < ApplicationRecord
	has_many :email_formats
	
	after_initialize :init_email_formats

	def self.search(search)
		if search
			result = where("lower(domain_url) LIKE ?", "%#{search.downcase}%")
			return result
		else
			all
		end
	end

	def init_email_formats
		if new_record?
			email_formats.build(format: "fn.ln@domain_url", score:0)
			email_formats.build(format: "fn.ln@domain_url", score:0)
		end
	end
end
