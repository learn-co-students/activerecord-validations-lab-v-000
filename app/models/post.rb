class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction","Non-Fiction"]}
    validate :clickbait?

    CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]

    def clickbait?
        if CLICKBAIT.none?{|item| item.match(title)}
            errors.add(:title, "must be clickbait")
        end
    end
end

