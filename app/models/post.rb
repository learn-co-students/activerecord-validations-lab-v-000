class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10, maximum: 100}
end
