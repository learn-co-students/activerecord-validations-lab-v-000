class Post < ActiveRecord::Base
  CLICKBAIT = ["Won't Believe", "Secret", "Top[number]", "Guess"]
  validates :title, presence: true
  validate :title_contains_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  def title_contains_clickbait
    if title != nil
      if !CLICKBAIT.any? {|word| title.include?(word)}
        errors.add(:title, "must contain clickbait")
      end
    end
  end

end
