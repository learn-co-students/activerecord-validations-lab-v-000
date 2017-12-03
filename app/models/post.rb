class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    
    
    validate :clickbait, on: :create
 
  def clickbait
      indicators = ["Won't Believe", "Secret", "Top", "Guess"]
      if title != nil
         if indicators.map {|indicator| title.include?(indicator)}.include?(true)
        else
          errors.add(:title, "must include clickbait terms")
         end
      end
  end
 
  
    
end
