class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :is_clickbait?
  validates(:content, { :length => { :minimum => 244 } })
  validates(:summary, { :length => { :maximum => 244 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  #regex quick reference; http://www.zenspider.com/ruby/quickref.html#types
  #http://womanonrails.com/custom-rails-validators
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
