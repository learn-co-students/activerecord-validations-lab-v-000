


class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: [ "Fiction", "Non-iction"], message: "please include fiction or non-fiction for the category" }
    validate :is_clickbaity?
    
      def is_clickbaity?
          if [ "Won't Believe", "Secret", "Top [number]", "Guess"].any? { |i| title.inclue? i }
            errors.add(:title, 'Need a title starting with some more clickbait please!')
          end
      end
end
