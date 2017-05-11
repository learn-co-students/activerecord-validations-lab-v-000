class Post < ActiveRecord::Base

  CLICKABLE_TITLES = ["Won't Believe", "Secret", "Top[number]", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait
    if title.present? && CLICKABLE_TITLES.none? { |t| title.include?(t)}
      errors.add(:title, "must be clickbait")
    end
  end

  # def is_clickbait?
  #     if !title.nil? && !CLICKABLE_TITLES.any?{ |t| title.include?(t)}
  #       errors.add(:title, "must be clickbait")
  #     end
  # end

end
