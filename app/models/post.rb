class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :must_be_click_baity

  def must_be_click_baity
    unless title =~ /(Won't Believe)|(Secret)|(Guess)|(Top\s\d+)/
      errors.add(:title, "is not click-baity enough")
    end
  end

end
