class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 100}
  validates :category, 
end


