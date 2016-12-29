class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"  }
  validate :title_must_be_clickbait

  def title_must_be_clickbait
    unless title =~ /Won\'t Believe/ || title =~ /Secret/ || title =~ /Top [1-9]/ || title =~ /Guess/
      errors.add(:title, "not clickbait-y")
    end
  end
end
