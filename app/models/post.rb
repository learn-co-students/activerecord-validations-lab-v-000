

require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


validate :is_clickbait?
  def is_clickbait?
  cb = [/Won't Believe/i,/Top [0-9]*/i,/Guess/i,/Secret/i]
  if cb.none? {|x| x.match(self.title)}
    errors.add(:title, "must be clickbait")
  end
  end


end
