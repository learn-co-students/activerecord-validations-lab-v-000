class Post < ActiveRecord::Base

  def clickbait
    num = /[0..9]*/
      t = [/Won't Believe/i, /Secret/i, /Top #{num}/i, /Guess/i]
      if !t.any? { |pat| pat.match(title) }
      errors.add(:title, "the title must be must be clickbait")
    end
  end

  validate :clickbait

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
# if categorires post does not match categorires then raise error
# end
end
