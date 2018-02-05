class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :clickbait?

  CLICKBAIT_CHOICES = [/Won't Believe/i, /Secret/i, /Top \d+/i, /Guess/i]

  def clickbait?
    if CLICKBAIT_CHOICES.none? {|choice| choice.match(title)}
      errors[:title] << "title must contain clickbait"
    end
  end
end

# CLICKBAIT_CHOICES constant stores array of clickbait terms that title attribute of post instance can contain
# the iterator #none? returns true if none of the array elements make the block evaluate to true
# the method #match returns a MatchData object if a match is found and nil (falsey value) if no match is found
# the argument passed to #match is the string title attribute of post instance, returned by calling #title reader on implicit self (post instance)
# so if it is true that none of the clickbait terms are included in the title attribute of post instance
# clickbait? returns false because we add the error message
# self refers to the post instance in instance scope of #clickbait? instance method
# #errors is implicitly called on post instance (self)
