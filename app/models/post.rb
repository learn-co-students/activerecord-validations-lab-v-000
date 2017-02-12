require 'pry'

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a category" }
    validate :title_must_have_clickbait

    def title_must_have_clickbait
        if title
              errors.add(:title, "must have clickbait") unless title.match(/(Won't Believe)|(Secret)|Top \d+|(Guess)/i)
        end
    end

# binding.pry

end
