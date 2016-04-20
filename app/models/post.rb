class Post < ActiveRecord::Base
  CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess", "Won't"]
  validate :title_contains_clickbate
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  def title_contains_clickbate
    if title
      CLICKBAIT.any? {|word| title.include?(word)}
    end
  end


end
