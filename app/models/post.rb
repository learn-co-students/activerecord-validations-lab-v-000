class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
  validates :title, format: {with: /(Won't Believe|guess|secret|top\s\d)/i, message: "Title needs to be more clickbaity"}

  # def title_is_not_clickbait
  #   #Title is a string so it must search by reg expression? for "won't believe", "secret", "top [number]", "guess"
  #   if !(/^.*(Won't Believe|guess|secret|top\s\d).*$/i.match(:title))
  #     errors.add(:title, "Title needs to be more clickbaity")
  #   end
  # end
end
