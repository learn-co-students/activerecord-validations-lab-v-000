class Post < ActiveRecord::Base
	include ActiveModel::Validations
	validates :title, presence: true
	validates :content, length: { minimum: 10 }
	validates :summary, length: { maximum: 25 }
	VALID_NAMES = %w(Fiction Non-Fiction)
	validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    	message: "%{value} is not a valid size" }

    validate :click_bait?




private

CLICKBAIT = [
	/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i

]

  def click_bait?
      if CLICKBAIT.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end

