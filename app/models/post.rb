class Post < ActiveRecord::Base
  
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :content, length: { minimum: 250 }
  validates :title, presence: true 
  # title - required, must contain one of the following:  "Won't Believe", "Secret", "Top [number]", or "Guess"
  
end
