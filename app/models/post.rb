class Post < ActiveRecord::Base
  validates :title, presence: true, title_is_clickbaity: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}

  validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
    message: "%{value} is not a valid category." }
end
