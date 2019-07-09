class MyValidator < ActiveModel::Validator
  def validate(record)
    phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if record.title
      if phrases.any? { |phrase|
        record.title.include?(phrase)
        }
      else
        record.errors.add(:title, "is not clickbaity enough")
      end
    end
  end
end
