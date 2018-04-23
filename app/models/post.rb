class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_is_clickbait_y

  def title_is_clickbait_y
  clickbait = [ /Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
   if clickbait.none?{|bait|bait.match title}
     errors.add(:title, "Must contain one of the clickbait words/phrases")
   end
 end

end
