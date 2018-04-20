class Post < ActiveRecord::Base


  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 299}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?


  private

  def is_clickbait?
    if self.attributes.values.include?("Won't Believe")
      true
    elsif self.attributes.values.include?("You Won't Believe These True Facts")
      true
    elsif self.attributes.values.include?("Secret")
      true
    elsif self.attributes.values.include?("Top")
      true
    elsif self.attributes.values.include?("Guess")
      true
    else
      errors.add(:title, false)
    end
  end



  # FI Solution
  #   CLICKBAIT_PATTERNS = [
    # /Won't Believe/i,
  #   /Secret/i,
  #   /Top [0-9]*/i,
  #   /Guess/i
  # ]

  # def is_clickbait?
  #   if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
  #     errors.add(:title, "must be clickbait")
  #   end
  # end

end