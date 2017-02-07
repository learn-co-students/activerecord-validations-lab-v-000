require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates( :content, { length: {minimum: 250}})
  validates( :summary, { length: {maximum: 250}})
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :clickbait?






  def clickbait?
    clickbait_titles = ["Won't Believe", "Secret", "Top/\d+/", "Guess"]
    if  !/Won't Believe|Secret|Top \d|Guess/.match(title)
      errors.add(:title, "its")
    end

    
  end

end
