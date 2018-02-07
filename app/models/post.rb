class Post < ActiveRecord::Base

  TOP_TITLES = ["Won't Believe", "Secret", "Top[number]", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :is_clickbait?

  def is_clickbait?
    if !title.nil? && !TOP_TITLES.any?{ |t| title.include?(t)}
      errors.add(:title, "must be clickbait")
    end
  end

end
