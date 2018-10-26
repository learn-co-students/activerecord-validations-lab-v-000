class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    if !record.title.nil? && ["Won't Believe", 'Secret', 'Top', 'Guess'].any? { |item| record.title.include? item }
      true
    else
      record.errors[:base] << "Not Clickbait"
    end
  end
end
