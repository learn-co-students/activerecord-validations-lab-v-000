class Post < ActiveRecord::Base

  validates :title, presence: true

  validates :content, length: { minimum: 250 }

  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbait

  OPTIONS = [/Won't Believe/, /Secret/, /Top[\d]/, /Guess/]

  def clickbait
    invalid = OPTIONS.none? { |option| option.match(title)}
    if invalid
      errors.add(:title, "title is not clickbait")
    end
  end

end
