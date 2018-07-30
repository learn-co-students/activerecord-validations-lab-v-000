class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  # category must be either Fiction or Non-Fiction (use inclusion)
  # example: validates :size, inclusion: { in: %w(small medium large),
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  # Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y.
  # If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess",
  # the validator should return false.
  validate :title_has_keywords

  def title_has_keywords
    if !!title
      unless ["Won't Believe", "Secret", "Top [number]", "Guess"].detect{|bait| title.include?(bait)}
        errors.add(:title, "Requires a click-bait' title")
      end
    end
  end

end
