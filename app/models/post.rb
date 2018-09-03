require 'pry'
class Post < ActiveRecord::Base
    validates_presence_of :title
    validates_length_of :content, :minimum => 250
    validates_length_of :summary, :maximum => 250
    validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
    validate :is_clickbait?

    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
  
    def is_clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  
end
