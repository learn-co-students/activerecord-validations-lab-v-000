class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait?

  CLICKBAIT = [
     /Won't Believe/i,
     /Secret/i,
     /Top [0-9]*/i,
     /Guess/i
   ]

   def click_bait?
     if CLICKBAIT.none? { |f| f.match title }
       errors.add(:title, "Title must be clickbait.")
     end
   end

end
