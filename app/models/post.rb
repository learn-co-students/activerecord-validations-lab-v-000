require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :post_is_clickbait

  def post_is_clickbait
    #if !["Won't Believe", "Secret", "Top [number]", "Guess"].include?(title)

    words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    temp = nil
    #binding.pry
      if title.present? && words.any? {|word| title.include?(word)}
        #binding.pry
      temp = true
      else
      errors.add(:title, "not clickbait-y")
      end

  end


end
