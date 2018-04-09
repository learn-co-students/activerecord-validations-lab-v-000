class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :ClickBaitTitle

  def ClickBaitTitle
    if !/\bWon't Believe|\bSecret|\bTop \d+|\bGuess/.match(self.title)
      errors.add(:title, "is not click baitey")
    end
  end
end
