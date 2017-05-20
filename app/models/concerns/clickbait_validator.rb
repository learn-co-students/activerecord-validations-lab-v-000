class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless ["Won't Believe", "Secret", "Top", "Guess"].any?{|c| record.title.include?(c) }
        record.errors[:title] << "Not clickbatey enough"
      end
    end
  end
end
