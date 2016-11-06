class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless is_clickbait(value)
      record.errors[attribute] << 'is not clickbait'
    end
  end

  def is_clickbait(value)
    value =~ /Won't Believe|Secret|Top [0-9]|Guess/
  end
end
