class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w( Fiction Non-Fiction) }
    # validate :clickbait
    validates_with TitleValidator
    
    # def clickbait
    #     valid = ["Won't Believe", "Secret", "Top", "Guess"]
    #     if title
    #         if !valid.any? {|word| title.include?(word)}
    #             errors.add(:title, "must contain required clickbait keywords")
    #         end
    #     end
    # end
    
end
