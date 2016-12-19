require "pry"
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbaity

  def clickbaity
    unless !title || title.match(/Won't Believe|Top[number]|Secret|Guess/)
      errors.add(:clickbaity, "Not clickbaity")
    end
  end
end
