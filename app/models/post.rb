class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  private

  def clickbait?
    if [/Won't Believe/, /Secret/, /Top[0-9]/, /Guess/].none? {|clickbait| clickbait.match title}
      errors.add :title, "clickbait"
    end
  end

end
