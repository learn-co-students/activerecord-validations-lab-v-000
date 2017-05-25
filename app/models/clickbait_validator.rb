class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bait = [/Won\'t Believe/, /Secret/, /Top \d+/, /Guess/]
    unless bait.any?{|b| value =~ b}
      record.errors[:attribute] << (options[:message] || 'must be clickbaity')
    end
  end
end