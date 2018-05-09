


class Post < ActiveRecord::Base
    validate :is_clickbaity?
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: [ "Fiction", "Non-iction"], message: "please include fiction or non-fiction for the category" }

    
      def is_clickbaity?
          if title == nil || [ "Won't Believe", "Secret", "Top [number]", "Guess"].none? { |i| title.include?(i) }
            errors.add(:title, 'Need a title starting with some more clickbait please!')
          end
      end
end
