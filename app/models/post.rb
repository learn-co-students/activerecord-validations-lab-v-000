class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
    clickbaits = ["Won't Believe", "Secret", "Top /\d+/", "Guess"]
    clickbaits.each do |clickbait|
      if record.title and record.title.include?(clickbait)
        break
      elsif clickbait == clickbaits.last
        record.errors[:title] << "Post title needs to have a clickbait"
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validates_with ClickBaitValidator
end
