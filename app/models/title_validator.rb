class TitleValidator < ActiveModel::EachValidator
 def validate_each(record, attribute, value)
    unless value =~ /(Won't Believe | Secret | Top [number] | Guess)/ 
      record.errors[attribute] << (options[:message] || "is not clickbait-y")
    end
  end
end