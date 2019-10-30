class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 20}
    validates :summary, length: {maximum: 45}
    validates :category, inclusion: { in: %w(Fiction NonFiction)}
    validate :is_clickbait?

    Clickbait = [/Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

    def is_clickbait?
        if Clickbait.none? { |c| c.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
