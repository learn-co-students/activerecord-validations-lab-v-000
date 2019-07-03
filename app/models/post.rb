class Post < ActiveRecord::Base

  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_click_bait? 

  def is_click_bait?
    title = self.title
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    result = clickbait.any? {|bait| title.include?(bait) if title}
    if result != true
      errors.add(:title, "It's not clickbait!")
      return false
    end 
    true
  end
end
