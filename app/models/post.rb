require 'pry'

class MyValidator < ActiveModel::Validator
  def validate(record)
    #binding.pry
    words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    words.any? {|word| return if record.title.include?(word)} unless record.title.nil?
    record.errors.add :title
  end
end

class Post < ActiveRecord::Base
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

end
