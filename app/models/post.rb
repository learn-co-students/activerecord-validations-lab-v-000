class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait

  def clickbait
    if !title.nil? && (!title.match(/Won't Believe/) && !title.match(/Secret/) && !title.match(/Top [0-9]/) && !title.match(/Guess/))
      errors.add(:title, "No clickbait present in title")
    end
  end

end
