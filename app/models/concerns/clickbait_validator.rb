#class ClickBaitValidator < ActiveModel::Validator
#    def validate(record)
#        if !record.title.downcase.include?("won't believe") && !record.title.downcase.include?(/top\s\d+/.to_s) && !record.title.downcase.include?("secret") && !record.title.downcase.include?("guess")
#            record.error.add(:title, "is not clickbait")
#        end
#    end
#end
