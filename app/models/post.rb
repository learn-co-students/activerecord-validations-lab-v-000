class MyValidator < ActiveModel::Validator
  def validate(record)
    # binding.pry
    if record.title == nil
      record.errors[:name] << "Must have a title"
    else
      unless record.title.include?("Won't Believe")
        record.errors[:name] << "Must be clickbait"
      # "Won't Believe", "Secret", "Top[number]", "Guess"
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  include ActiveModel::Validations
  validates_with MyValidator
end
