class TitleValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        unless value =~ /\b(Won't Believe|Secret|Top|Guess)\b/i
            record.errors[attribute] << (options[:message] || "is not clickbait")
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true, title: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end

