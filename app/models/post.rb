class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {within: %w(Fiction  Non-Fiction)}
	validate :is_clickbait?

  def is_clickbait?
  	clickbait_patterns = [
	    /Won't Believe/,
	    /Secret/,
	    /Top [0-9]*/,
	    /Guess/
  	]

    if clickbait_patterns.none? { |pattern| pattern.match(self.title) }
      errors.add(:title, "must be clickbait-y")
    end

  end
end

