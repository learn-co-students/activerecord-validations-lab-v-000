class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w( Fiction Non-Fiction )}
    validate :clickbait?

    def clickbait?
        if title && !(title.match(/Won't Believe/i) || title.match(/Secret/i) || title.match(/Top [0-9]*/i) || title.match(/Guess/i))
            errors.add(:title, "can't fish without bait!")
        end
    end
end
