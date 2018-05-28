
class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait

  def non_clickbait
    require_one = ["Won't Believe", "Secret", "Top", "Guess"]
    valid_title = false
    require_one.each do |item|
      if self.title && self.title.include?(item)
        valid_title = true
      end
    end
    if !valid_title
      errors.add(:title, "Needs a clickbaity title")
    end
  end


end
