class Post < ActiveRecord::Base
  validates :title, length: {minimum: 2}
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_baity

  def click_baity
    if title == nil || title.scan(/(Won't Believe|Guess|Secret|Top \d?)/).empty?
      errors.add(:title, "You need a catchier title!")
    end
  end




end
