class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CLICKBAIT= ["Won't Believe", "Secret", "Top[number]", "Guess"]

  def is_clickbait?
    if !title.nil? && !CLICKBAIT.any? {|bait| title.include? bait}
      errors.add(:title, "must contain clickbait: #{CLICKBAIT}")
    end
  end
end
