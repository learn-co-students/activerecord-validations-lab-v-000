class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait #use without the s to define instance method

  private

  CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]

  def clickbait
    if title != nil
      if CLICKBAIT.none?{|bait| title.include?(bait)}
        errors.add(:title, "not suffiently clickbait-y")
      end
    end
  end
end
