class ClickbaitValidator < ActiveModel::EachValidator

def validate_each(record, attribute, value)

      unless value.include?("Won't Believe") || value.include?("Secret") || value.include?("Top [number]") || value.include?("Guess")
        record.errors[attribute] << (options[:message] || "not clickbaity enough")
      end
    end

end




# def clickbait
#   self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess")
# end