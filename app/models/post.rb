class Post < ActiveRecord::Base
  
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :content, length: { minimum: 250 }
  validates :title, presence: true 
  validate :clickbait_title
  
  private
  
    def clickbait_title
      words = ["Won't Believe", "Secret", "Guess"]
      
      unless title.in?(words) || title.match?(/Top [0-9]/)
        errors.add(:title, "Needs more clickbait!")
      end
    end
    
end

# title - required, must contain one of the following:  "Won't Believe", "Secret", "Top [number]", or "Guess"
# https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
# must contain one of the following: "Won't Believe", "Secret", "Top [number]", or "Guess"

