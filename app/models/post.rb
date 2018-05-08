class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


  BAITS = [/Won't Believe/i, /Secret/i, /Top[0-9]*/i, /Guess/i]
  # Make a constant variable, use regex to store the clickbait titles
  # the i makes it case sensitive

  validate :clickbait?
  # clickbait validation
  # Say validate instead of validates because we're validating one case

  def clickbait?
    # iterate over BAITS variable, match the values of the array with the title
    # if the title matches the method will return "add click-bait to title"
    # if the title doesn't match the method will end
    if !BAITS.find{|b| b.match title}
      errors.add(:title,"add click-bait to title")
    end
  end
end
