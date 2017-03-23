class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait, on: :create

  def clickbait
    words = ["Won't Believe","Secret","Top [number]","Guess"]
    errors.add(:title, "Must be more clickbait-y!") unless
    self.title && words.any?{|word| self.title.include?(word)}
  end

end
