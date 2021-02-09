class Post < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_title

    CLICKBAIT = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    def clickbait_title
        if title
      if CLICKBAIT.none? {|cb| title.include?(cb)}
            errors.add(:title, "Not Clickbait-y Title")
            
        end 
      end       
    end
end

