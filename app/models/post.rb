class Clickbaiter < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess") 
        record.errors[:base] << "title not clickbaity"
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with Clickbaiter
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Non-Fiction Fiction), 
    message: "%{value} is not a valid category" }
end



