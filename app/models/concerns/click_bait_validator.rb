
class ClickBaitValidator < ActiveModel::Validator

  def validate(record)
    if record.title != nil
      name = record.title
      number = (0..9)
      if (name.include? "Secret") || (name.include? "Guess") || (name.include? "Won't Believe") || (name.include? "Top #{number}")
        true
      else
        record.errors[:title] << "is not click bait"
      end
    end
  end
end
