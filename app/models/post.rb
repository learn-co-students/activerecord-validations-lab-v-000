class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?


    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
    ]



    def clickbait?
        if CLICKBAIT_PATTERNS.none? {|pattern| pattern.match title }
        	errors.add(:title, "must be clickbait")
      end
    end
 #found this in Ruby on Rails guide for #none method
# success = responses.none? {|r| r.status / 100 == 5 }
#needed to modify to use for this lab using CLASS CONSTANT FOR TITLES TO
#include as ClickBait


end
