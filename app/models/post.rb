class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 200 }
	validates :summary, length: { maximum: 200 }
	validates :category,inclusion: { in: %w(Fiction) }
	validate  :clickbait

	def clickbait
    clickbait = [/Won't Believe/i, /Secret/i, /Top [10]*/i, /Guess/i]
    if clickbait.none? { |phrase| phrase.match title }
      errors.add(:title, "this is clickbait!!!")
    end
  end

end
