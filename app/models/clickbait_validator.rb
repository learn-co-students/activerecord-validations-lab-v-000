class ClickbaitValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe|Secret|Top [0-9]|Guess/
      record.errors[attribute] << (options[:message] || "is not clickbait-y enough")
    end
  end

end
