class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, :in => ["Fiction", "Non-Fiction"]

  validate :clickbait_title?

  Clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait_title?
    if !Clickbait.detect {|w| w.match title}
      errors.add(:title, "Must be clickbait")
    end
  end
end
