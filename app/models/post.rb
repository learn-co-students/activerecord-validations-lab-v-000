class TitleValidator < ActiveModel::Validator
    CLICKBAIT_STRINGS = [
        /Won\'t\sBelieve/,
        /Secret/,
        /Top\s\d/,
        /Guess/
    ]

    def validate(record)
        return if record.title.nil?
        unless CLICKBAIT_STRINGS.any? { |s| s.match(record.title) }
            record.errors.add(:title, "needs to be more clickbait.")
        end
    end
end


class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with TitleValidator
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

end
