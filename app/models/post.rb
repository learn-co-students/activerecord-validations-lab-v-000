class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?


  def is_clickbait?
    options = ["Won't Believe", "Secret", "Top (/[0..9]*/)", "Guess"]
    if options.none? {|option| title.include?(option) if !!title}
      errors.add(:title, "must contain clickbait phrase")
    end
  end
end
