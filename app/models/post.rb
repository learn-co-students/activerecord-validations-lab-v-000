class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_include

  TITLE_MATCH_ARRAY = [/Won't Believe/, /Secret/, /Top [0..99]/, /guess/]

  def title_include
    if TITLE_MATCH_ARRAY.none? {|a| a.match(title)}
      errors.add(:title, "Title is not sufficiently
      clickbait-y")
    end
  end
end
