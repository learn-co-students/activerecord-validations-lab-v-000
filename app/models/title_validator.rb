class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    clickbait = clickbait_words.detect do |w|
      record.title.include?(w)
    end
    if !clickbait
      record.errors[:title] << 'Need a more clickbait-y title, please!'
    end
  end
end
