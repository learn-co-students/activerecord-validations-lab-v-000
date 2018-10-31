class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :click_bait

    def click_bait
        click_bait = [/Won't Believe/i, /Secret/i, /Top [\d*]/i, /Guess/i]

        if click_bait.none? { |words| words.match title}
            errors.add(:title, "does not have enough clickbait")
        end
    end
end
