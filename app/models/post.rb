class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  BAITS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  validate :has_bait?

  def has_bait?
    if !BAITS.find{|b| b.match title}
      errors.add(:title, "add click-bait to title")
    end
  end
end
