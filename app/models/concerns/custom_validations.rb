class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A.*(Won't Believe|Secret|Top [0-9]+|Guess).*\z/i
      record.errors[attribute] << (options[:message] || "is not gonna get those sweet sweet clicks")
    end
  end
end