class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :summary, length: {maximum: 250}
    validates :content, length: {minimum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_validation

    private
    def clickbait_validation
        if !(/Won't Believe|Secret|Top [0-9]|Guess/.match(title))
            errors.add(:title, "Must be clickbait")
        end
    end

end
