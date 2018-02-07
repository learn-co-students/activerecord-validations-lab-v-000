class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    # binding.pry
    if title && title.scan(/Won't Believe|Guess|Secret|Top [\d]+/).empty?
       errors.add(:title, "is not good")
    end
  end
end
