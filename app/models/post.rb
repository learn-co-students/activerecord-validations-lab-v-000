class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Non-Fiction Fiction) }
    validate :clickbait_title?

    CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-20]*/i, /Guess/i]

    def clickbait_title?
      if CLICKBAIT.none? {|bait| bait.match title}
        errors.add(:title, "isn't clickbait.")
      end
    end
end
