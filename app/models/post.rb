class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction)}
  validate :is_clickbait?

  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/,
    /Top [0-9]*/i,
    /Guess/i
  ]


  def is_clickbait?
    if CLICKBAIT.none? {|instance| instance.match title }
        errors.add(:title, "must be clickbait")
      end 
    end 

end
