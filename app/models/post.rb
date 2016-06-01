class Post < ActiveRecord::Base
  validates_presence_of :title  
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} must be either Fiction or Non-Fiction"}
  
  include ActiveModel::Validations
  validates_with ClickBaitValidator

  # can also do:
  # validates :title, exclustion: { in: ["Won't Believe", "Secret", /Top [0-9]*/i, "Guess", "True Facts"], message: "your error message"}

  # solution on learn

  # validate :is_clickbait?

    # CLICKBAIT_PATTERNS = [
    #   /Won't Believe/i,
    #   /Secret/i,
    #   /Top [0-9]*/i,
    #   /Guess/i
    # ]

    # def is_clickbait?
    # if title == nil || title.scan(/(Won't Believe|Guess|Secret|Top \d?)/).empty?
    
    # or
    
    # if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    
    #     errors.add(:title, "must be clickbait")
    #   end
    # end
end
