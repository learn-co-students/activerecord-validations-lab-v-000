class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion:  { in: %w(Fiction Non-Fiction),
    message: "%{value} is not valid" }
  validate :clickbait

  def clickbait
    errors.add(:title, "Please use a clickbaity title") if !title || !title.downcase.match(/won't believe|secret|top \d|guess/)
  end
end
