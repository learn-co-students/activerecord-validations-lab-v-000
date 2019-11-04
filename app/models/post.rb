class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|bait| value.to_s.include?(bait)}
      record.errors[attribute] << (options[:message] || "Not clickbait-y enough")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction fiction Non-Fiction non-fiction)}
end
