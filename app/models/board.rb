class Board < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true

	belongs_to :owner, :class_name => "User", :foreign_key => :user_id

	has_many :comments, :dependent => :destroy

	def editable_by?(user)
		user && user == owner
	end
end
