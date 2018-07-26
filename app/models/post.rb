class Post < ActiveRecord::Base
  include ActiveModel::Validations
  
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validates :category, exclusion: { in: [nil] }
  validates_with Clickbait
end
  
  
class Clickbait < ActiveModel::Validator
  def validate(title) 
    unless ["Won't Believe", "Secret", /[Top]+\s+\d*/, "Guess"].include?(title)
      errors.add(:title, "Must be clickbaity")
    end
  end
  
end
