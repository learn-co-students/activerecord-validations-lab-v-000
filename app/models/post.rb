require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait


  def clickbait
    click_bait = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
      #binding.pry
    if click_bait.none?{ |c| c.match title }

      errors.add(:title, "wrong")
    end
  end
end
