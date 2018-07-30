class MyValidator < ActiveModel::Validator
  def validate(record)
    phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if phrases.any? { |phrase| record.title.include? phrase }
      record.errors
    end
  end
end
