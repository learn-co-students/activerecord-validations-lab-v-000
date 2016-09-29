class Post < ActiveRecord::Base
  CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess", "Won't"]

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_contains_clickbate


  def title_contains_clickbate
    if title
      if CLICKBAIT.none? {|phrase| title.include?(phrase)}
        errors.add(:title, "must contain clickbait")
      end
    end
  end


end
