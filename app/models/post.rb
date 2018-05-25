class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ["Won't Believe", "Secret", "Top", "Guess"].any? { |click_bait| value.include? click_bait }
      record.errors[attribute] << (options[:message] || "is not click baity enough")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
