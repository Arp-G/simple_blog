class Comment < ApplicationRecord
  belongs_to :blog

  validates :content,:writter, presence: true
  validates :content, length: { minimum: 10 , maximum: 150 }
end
