class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "is not a valid category" }
  validate :clickbait

  def clickbait 
    valid_titles = [/Won't Believe/i,/Secret/i,/Top\s\d/i,/Guess/i]
    
    errors.add(:title, "must be clickbait") if valid_titles.none? { |t| t.match title }
  end
end