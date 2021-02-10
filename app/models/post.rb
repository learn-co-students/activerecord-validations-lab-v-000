class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  STATEMENTS = [/Won't Believe/, /Secret/, /Guess/, /Top \d*/]

   def clickbait
     if STATEMENTS.none? {|state| state.match(title)}
       errors.add(:title, "needs to be more clickbait-y")
     end
   end

end
