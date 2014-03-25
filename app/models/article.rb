class Article < ActiveRecord::Base
	belongs_to :user

	scope :published, -> { where(:is_published => true) }
	scope :drafts, -> { where(:is_published => false) }

	def publish
		self.update_attribute(:is_published, true)
	end
	
end
