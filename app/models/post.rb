class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

def non_clickbait
  click_bait = ["Won't Believe", "Secret", "Top", "Guess"]
  if title
    if click_bait.none? {|word| title.include?(word)}
    errors.add(:title, "This is not clickbait")
  end
  end
end
end
