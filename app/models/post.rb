class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, in: %w(Fiction Non-Fiction)
  validate :clickbait?

  def clickbait?
    words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
		if title?
			errors.add(:title, "must be clickbait") unless words.any? { |word| title.include?(word)}
		end
  end
end
