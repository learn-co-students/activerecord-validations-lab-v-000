class ClickBaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe|Secret|Top [0-9]|Guess/
      record.errors[attribute] << (options[:message] || "is not good clickbait")
    end
  end
end
