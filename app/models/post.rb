class Post < ActiveRecord::Base

  validates :title, presence: true
  #validate :must_be_clickbait
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  # My attempts did not pass:
  # def must_be_clickbait
  #   if title.include?("Won't Believe") || !title.include?("Secret") || !title.include?("Top") || !title.include?("Guess")
  #     errors.add("Not sufficiently clickbaity")
  #   end
  # end

  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end


end
