class Post < ActiveRecord::Base
  CLICKBAIT_ARRAY  = [ /Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate  :is_clickbait?

  def is_clickbait?
    if !CLICKBAIT_ARRAY.detect { |clickbait_elem| clickbait_elem.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
