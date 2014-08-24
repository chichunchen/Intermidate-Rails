class Board < ActiveRecord::Base

	searchable do 
		text  :title, :description
	end

	validates :title, presence: true
	validates :description, presence: true
	# validates :category_id, presence: true

	belongs_to :owner, :class_name => "User", :foreign_key => :user_id

	has_many :comments, :dependent => :destroy

	belongs_to :category

	def editable_by?(user)
		user && user == owner
	end
end
