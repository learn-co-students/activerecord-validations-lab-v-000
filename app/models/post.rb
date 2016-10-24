require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait?

  def click_bait?
    if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? { |w| w.match(title) }
      errors.add(:title, "not clickbait")
    end
  end

end
