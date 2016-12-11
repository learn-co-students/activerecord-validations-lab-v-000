class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, format: { without: /\A[too short]+\z/ }
  validates :summary, length: { :maximum => 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :validate_each?

  def validate_each?
    if !/Won't Believe|Secret|Top \d|Guess/.match(title)
      errors.add(:title, "is not clickbait-y enough")
    end
  end
end
