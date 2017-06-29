class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait

  def clickbait
    if title
      errors[:title] << 'Needs to be more clickbait!!!' unless title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
    end
  end
end
