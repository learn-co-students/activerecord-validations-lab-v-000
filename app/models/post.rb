class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
    acceptable_titles = ["Won't Believe", "Secret", "Top [number]","Guess"]
    if self.title && !acceptable_titles.any? {|title| self.title.include?(title)}
      errors.add(:title, "Needs to be clickbaitier")
    else
      true
    end
  end
end
