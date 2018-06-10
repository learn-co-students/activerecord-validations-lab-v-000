# class ClickbaitValidator < ActiveModel::Validator
#   def validate(record)
#     if record.title
#     unless record.title.match(/(Won't Believe|Secret|Top \d*|Guess)/)
#       errors[:title] << "That's not sufficiently clickabait-y!"
#     end
#   end
# end


class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value
    unless value.match(/(Won't Believe|Secret|Top \d*|Guess)/)
      record.errors[attribute] << (options[:message] || "is not sufficiently clickabait-y!")
    end
  end
end
