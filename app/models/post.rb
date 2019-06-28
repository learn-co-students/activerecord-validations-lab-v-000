class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


    def clickbait 
        unless title.include? "Won't Believe" 
            errors.add(:discount, "must be clickbait")
        end
    end
end
