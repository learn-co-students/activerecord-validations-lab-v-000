class ClickbaitValidator < ActiveModel::EachValidator

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top[0-9*]/i, /Guess/i]

  def validate_each(record, attribute, value)
    if CLICKBAIT.none? {|bait| bait.match(value)}
      record.errors[attribute] << "You need to add clickbait!"
    end
  end

end
