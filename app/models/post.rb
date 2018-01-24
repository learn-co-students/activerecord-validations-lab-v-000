require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  #CLICKBAIT = ["Won't Believe", "Secret", "Top
#[0-9]","Guess"]
#@title = :title

  def clickbait?
#binding.pry
  if title
        errors.add(:title, "not clickbait") unless (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top[0-9]")  || title.include?("Guess"))
    end

  end
end
