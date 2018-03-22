class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    bait = /Top [0-9]/
    if self.title
      if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.match(bait) && !self.title.include?("Guess")
        errors.add(:title, "must be clickbait")
      end
    end
  end
end
