class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title =~ /Won\'t Believe/ || record.title =~ /Secret/ || record.title =~ /Top\s+\d+/ || record.title =~ /Guess/
      record.errors[:title] << "Make this ClickBaity. Won't Believe, Secret, Top [digit] or Guess are great ways to get people's attention."
    end
  end
end
