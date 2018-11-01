class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category,inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    strings = ["Won't Believe","Secret","Guess", "Top [number]"]

    if !(title && strings.any?{|string| title.match(string)})
      errors.add(:title, "blah")
    end

    end

  end
