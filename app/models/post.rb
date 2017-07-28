require 'pry'
class Post < ActiveRecord::Base
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :title, presence: true
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :clickbait_title, on: :create

  def clickbait_title
    @@clickbait_phrases = [/Won't Believe/, /Secret/, /Top \d/, /Guess/ ]
    errors.add(:title, "is not clickbait") unless @@clickbait_phrases.any? { |w| title =~ /#{w}/ }
  end
end
