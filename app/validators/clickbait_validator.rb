class ClickbaitValidator < ActiveModel::Validator
  CLICKBAIT_PHRASES = [
    /Won't Believe/i, /Secret/i, /Guess/i, /Top\s\d*/i
  ]

  def validate(record)
    if CLICKBAIT_PHRASES.none? { |phrase| phrase.match(record.title) }
      record.errors[:title] << "This title is not clickbatey enough."
    end 
  end
end
