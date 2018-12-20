class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?
    unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|zinger| value.include?(zinger)}
      record.errors[attribute] << (options[:message] || "is not clickbait")
    end
  end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :title, clickbait: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 40 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

end
