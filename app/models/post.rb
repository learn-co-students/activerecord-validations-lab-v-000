class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 150 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

#add a custom validator to Post that ensures the title is sufficiently clickbait-y
#If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.
  def is_clickbait?
    bait = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
    bait.each do |b|
      if self.title.nil? || !self.title.match(b)
        errors.add(:title, "not clickbait-y")
      elsif self.title.match(b)
        return true
      end
    end
  end

end
