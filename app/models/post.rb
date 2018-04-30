class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  @@clickbait = [
    /Won't Believe/,
    /Secret/,
    /Top \d/,
    /Guess/]

  def clickbait?
    if @@clickbait.none? {|bait| bait.match title}
      errors.add(:title, "Not clickbait-y enough for the clickbait club.")
    end
  end
end
