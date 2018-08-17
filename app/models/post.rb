class Post < ActiveRecord::Base
  include ActiveModel::Validations 
  validates_with ClickBait
  
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :content, length: { minimum: 250 }
  validates :title, presence: true 
  # title - required, must contain one of the following:  "Won't Believe", "Secret", "Top [number]", or "Guess"
  
end

# https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
# must contain one of the following: "Won't Believe", "Secret", "Top [number]", or "Guess"

class ClickBait < ActiveModel::Validator
  
  def validate(title)
    words = ["Won't Believe", "Secret", "Guess"]
    
    unless title.in?(words) || title.match?(/Top [0-9]/)
      record.errors[title] << "Needs more clickbait!"
    end
  end
  
end