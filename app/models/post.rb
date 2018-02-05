class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :clickbaity_enough?

  TITLES = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbaity_enough?
    if TITLES.none? { |t| t.match title }
      errors.add(:title, "Invalid title")
    end
  end
  
end

