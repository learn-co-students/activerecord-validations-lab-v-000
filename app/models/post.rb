class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    if [/(top)+\d/i, /won't believe/i, /secret guess/i].none? { |x| x.match(title) }
      errors.add(:title, "must be clickbait")
    end
  end

end
