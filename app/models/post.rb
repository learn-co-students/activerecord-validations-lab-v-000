class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    clickbait_titles = %w(Won't Believe Secret Top Guess)

    if !title.nil? && !clickbait_titles.any? {|bait| title.include? bait}
      errors.add(:title, "must be 'clickbait-y'")
    end
  end
end
