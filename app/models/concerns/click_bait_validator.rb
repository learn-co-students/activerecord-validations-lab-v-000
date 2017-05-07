
class ClickBaitValidator < ActiveModel::Validator

  def validate(record)
    if record.title != nil
      name = record.title
      if (name.include? "Secret") || (name.include? "Guess") || (name.include? "Won't Believe")
        true
      else
        record.errors[:title] << "is not click bait"
      end
    end
  end
end
