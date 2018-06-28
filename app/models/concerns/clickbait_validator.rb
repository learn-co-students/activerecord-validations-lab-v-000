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