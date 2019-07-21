class Blog < ApplicationRecord
	validates :title,:author,:content , presence: true
	validates :content , length: { maximum: 10000, minimum: 10 }

	has_many :comments, dependent: :destroy
end
