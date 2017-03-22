class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    if record.title.present? && !record.title.include?("Won't Believe" || "Secret" || "Top" ||"Guess")
      record.errors[:base] << "Not clickbait worthy. Try again."
    end
  end
end
