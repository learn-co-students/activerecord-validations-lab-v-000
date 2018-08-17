class Post < ActiveRecord::Base
  
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :content, length: { minimum: 250 }
  validates :title, presence: true 
  validate :clickbait_title
  
  private
  
    def clickbait_title
      if title
        words = ["Won't Believe", "Secret", "Guess"]
        
        has_words = words.any? do |word|
          title.include?(word)
        end
  
        unless has_words || title.match(/Top [0-9]/)
          errors.add(:title, "Needs more clickbait!")
        end
        
      end
      
    end
    
end



