class Validator < ActiveModel::Validator
  def validate(record)
    if record.title != nil
      unless record.title.match?(/(You|Won't Believe|Secret|Top \d|Guess)/)
        record.errors[:title] << 'Please add a clickbait title!'
      end
    end
  end
end 