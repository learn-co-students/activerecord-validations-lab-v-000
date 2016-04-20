class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_must_include_clickbait

  def title_must_include_clickbait
    if title.present?
      clickbait = "Won't Believe"
      if !(title.scan(/#{clickbait}/)[0])
        errors.add(:title, "Must include clickbait")
      end
    end
  end
end
