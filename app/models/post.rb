class Post < ActiveRecord::Base

  #clickbait = lambda { |s| s.match title}
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate  :is_clickbait?

  TYPES = [/Won't Believe/i]

  def is_clickbait?
    if TYPES.none? { |p| p.match title }
      errors.add(:title, "must be clickbait")
    end
  end


end
