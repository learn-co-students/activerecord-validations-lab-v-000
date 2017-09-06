
class MyValidator < ActiveModel::Validator

    VALID_TITLE_WORDS = ["Won't Believe", "Secret", "Top", "Guess"]

    def validate(post)
        clickbatable = false
        VALID_TITLE_WORDS.each do |word|
            if post.title != nil && post.title.include?(word)
                clickbatable = true
            end
        end
        post.errors[:title] << 'Title needs to be clickbatable!' unless clickbatable
    end
end

class Post < ActiveRecord::Base

    include ActiveModel::Validations
    validates_with MyValidator

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}

end
