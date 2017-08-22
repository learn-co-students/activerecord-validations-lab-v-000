class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} can either be Fiction or Non-Fiction" }
  validate :title_clickbait?

  ClickBait = [/Won't Believe/i, /Secret/, /Guess/, /Top [0-100]/i ]

    def title_clickbait?
      if ClickBait.none? {|click| click.match title}
        errors.add(:title, "must be clickbait")
      end
    end
end
