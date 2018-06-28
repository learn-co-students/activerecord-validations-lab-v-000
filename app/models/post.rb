class ClickBaitValidator < ActiveModel::Validator
    def validate(record)
        if record.title != nil
            if record.title.downcase.include?("won't believe") || record.title.downcase.include?(/top\s\d+/.to_s) || record.title.downcase.include?("secret") || record.title.downcase.include?("guess")
                return true
            else
                return false
            end
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates_with ClickBaitValidator


    #def click_bait
    #    self.downcase.include?("won't believe") || self.downcase.include?(/top\s\d+/) || self.downcase.include?("secret") || self.downcase.include?("guess")
    #end
end
