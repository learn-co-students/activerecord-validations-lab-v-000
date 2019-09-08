class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 30 }
  validates :summary, length: { maximum: 30 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction) }
  validate :non_clickbait
  
  def non_clickbait
    if self.title.present? && !self.title.match?(/Won't Believe|Secret|Top[number]|Guess/)
      errors.add(:title, "title must include clickbait")
    end
  end
end
