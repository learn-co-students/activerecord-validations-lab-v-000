class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  

  
  CLICKBAIT = [
    "Won't Believe",
    "Secret",
    "Top",
    "Guess"
    ]
  
  def clickbait?
    CLICKBAIT.each do |i| 
      if self.title.to_s.include?(i)
        return true
      else
        errors.add(:title, "Not enough clickbait!")
        return false
      end
    end
  end

end
