require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid catagory"}
  validate :is_clickbait?


    CLICKBAIT_PHRASES = [                  #regular expression. That's why there's slashes.
      /Won't Believe/i,                     #the i makes it case insensitive
      /Secret/i,                            #must do this way bc the phrase just has to contain
      /Top[0-9]*/i,                         #it, it doesn't have to match exactly
      /Guess/i
      ]

      def is_clickbait?
        if CLICKBAIT_PHRASES.none? { |phrase| phrase.match title }
          errors.add(:title, "must be clickbait")
        end
      end
    end
