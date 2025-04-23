class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  validates :title, presence: true
  validates :content, presence: true
end
#포스트루비