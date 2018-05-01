class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Nonfiction)}
  validate :clickbait

CLICKBAIT = [/Won\'t Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]

  def clickbait
    if CLICKBAIT.none? {|t| t.match title}
      errors.add(:title, "Smells a little clickbait-y!")
    end
  end
end
