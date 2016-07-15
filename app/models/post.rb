class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} must be either Fiction or Non-Fiction" }
  validate :clickbait?

  CLICKBAIT = ["Won't Believe", "Secret", "Top
  [number]", "Guess"]

  def clickbait?
    if title != nil
      if CLICKBAIT.none? {|bait| title.include?(bait)}
        errors.add(:title, "Title must contain either: Won't Believe, Secret, Top(enter number), or Guess")
      end
    end
  end


end
