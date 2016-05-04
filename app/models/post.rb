class MyValidator < ActiveModel::Validator
  def validate(record)
    titles = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    titles.any? {|title1| return if record.title.include?(title1)} unless record.title.nil? 
    record.errors.add :title, "Invalid Title"
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction)}
end


