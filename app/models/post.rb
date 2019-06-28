class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates :title, presence: true, format: {with: /Won't Believe|Secret|Guess|Top [\d]*/i}
    #used rubular to handle the regex
    #https://stackoverflow.com/questions/40545638/rails-validate-format-with-regex
end
