class Post < ActiveRecord::Base
  attr_reader :allowed_genres
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 299}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :title_is_clickbait

  def title_is_clickbait
    if !/Won't Believe|Secret|Top \d{1,3}|Guess/i.match(title)
      errors.add(:title, "must be clickbate")
    end
  end
end
