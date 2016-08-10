class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: ["Fiction"]}
  validate :clickbait

  STATEMENTS = [/Won't Believe/, /Secret/, /Guess/, /Top \d*/]

  def clickbait
    if STATEMENTS.none? {|state| state.match(title)}
      errors.add(:title, "needs to be more clickbait-y")
    end
  end
end
