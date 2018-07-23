require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, { :length => { minimum: 250 } }
    validates :summary, { :length => { maximum: 250 } }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :clickbait_y
    def clickbait_y
      if self.title
        found = ["Won't Believe", "Secret", "Top ", "Guess"].any? { |click|
              self.title.include?(click)
        }
        if !found
          errors.add(:title,"Not clickbait-y")
        end
      end
    end
end
