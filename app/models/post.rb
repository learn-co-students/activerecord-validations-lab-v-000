class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, presence: true, length: {minimum: 250}
validates :summary, presence: true, length: {maximum: 250}
validates :category, inclusion: { in: %w(Fiction  Non-Fiction)}
validate :clickbait_y?

  def clickbait_y?
    # Make a constant variable, use regex to store the clickbait titles
    # the i makes it case sensitive
    clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if clickbait.none? { |t| t.match title }
      errors.add(:title, "Title doesn't contain matching text")
    end
  end
end

#rspec ./spec/models/post_spec.rb
