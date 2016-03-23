class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    if value.nil? || clickbait_words.none? { |word| value.include?(word) }
      record.errors.add(attribute, "must be clickbaity")
    end
  end

end