class Article < ActiveRecord::Base
	belongs_to :user

	scope :published, -> { where(:is_draft => false) }
	scope :drafts, -> { where(:is_draft => true) }

	def publish
		self.update_attribute(:is_draft, false)
	end
end
