
class ClickBaitValidator < ActiveModel::Validator

  def validate(record)
    unless record.title.include? "Won't Believe" 
      record.errors[:title] << "Need a more clickbait-y title please!"
    end
  end 
end