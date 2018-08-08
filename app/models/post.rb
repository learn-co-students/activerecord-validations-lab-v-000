class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_the_title_clickbait?

  def is_the_title_clickbait?
    if title.to_s.include?("Won't Believe" || "Secret" || "Top[0..10]" || "Guess")
      true
    else
      errors.add(:title, "The title must be clickbait.")
    end
  end

end
