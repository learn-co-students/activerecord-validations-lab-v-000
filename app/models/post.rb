class Post < ActiveRecord::Base
  validates :title, presence: :true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(fiction non-fiction Fiction Nonfiction)}
  validate :click_bait

  def click_bait
    if self.title =~ /(?i)won't believe|secret|Top\s\d*|guess/
    else
      errors.add(:title, "must be clickbaity")
    end
  end
end
