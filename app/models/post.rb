class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait_title

  def click_bait_title
    clickbait = [/Won't Believe/i, /Secret/i, /Top [1-10]*/i, /Guess/i]
    if clickbait.none? { |t| t.match self.title }
      errors.add(:title, "That'not click bait!")
    end
  end

end
