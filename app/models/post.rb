class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if !(/won't believe|secret|top[0-9]*|guess/i).match title
    errors.add(:title, "Clickbait worthy")
  end
end

end
