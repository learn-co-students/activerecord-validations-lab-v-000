class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validate :click_bait?


  CLICK_BAIT = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]

  def click_bait?
    errors.add(:title, "must be clickbait") unless !self.title.nil? && CLICK_BAIT.any? {|word| self.title.match word}
  end

end
