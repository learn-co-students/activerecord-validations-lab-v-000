class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?
  
  def is_clickbait?
    clickbait = /top \d+|won't believe|secret|guess/i

    unless title.nil?
      errors.add(:title, "must be clickbait-y!") unless title.match(clickbait)
    end
  end

end
