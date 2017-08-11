class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :valid_clickbait?

    CLICKBAIT = [/Won't Believe/i, /Secret/, /Guess/, /Top [0-100]/i ]

    private

    def valid_clickbait?
        if CLICKBAIT.none? {|cb| cb.match title }
        errors.add(:title, "This is not click-baity enough!")
        end
    end
end
