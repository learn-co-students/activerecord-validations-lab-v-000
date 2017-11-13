class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  CLICKBAIT_LISTS = ["Won't Believe", "Secret", "Top", "Guess"]


  def is_clickbait?
    unless title == nil
      if CLICKBAIT_LISTS.none? { |phrase| title.include?(phrase)}
        errors.add(:title, "Should Be Clickbait")
      end
    end
  end

end
