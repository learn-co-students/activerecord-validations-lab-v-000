class ClickbaitValidator < ActiveModel::Validator
  CLICKBAIT_PHRASES = ["Won't Believe", "Secret", "Guess"]

  def validate(record)
    if !record.title.nil?
      phrase_check = CLICKBAIT_PHRASES.any? do |phrase|
        phrase_check = record.title.include?(phrase)
      end

      top_list_check = record.title.match(/Top\s\d+/)
    end

    unless phrase_check || top_list_check
      record.errors[:title] << "This title is not clickbatey enough."
    end 
    
  end
end
