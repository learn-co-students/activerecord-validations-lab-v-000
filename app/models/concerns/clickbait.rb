class Clickbait < ActiveModel::Validator
  def validate(record)
    keywords = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    result = false
    if record.title != nil
      keywords.each do |word|
        if record.title.include?(word)
          result = true
        end
      end
    end
    if result == false
      record.errors[:clickbait] << 'Not click bait-y enough.'
    else
      result
    end
  end
end
