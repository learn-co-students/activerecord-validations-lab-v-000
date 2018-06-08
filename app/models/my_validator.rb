class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && ["Won't Believe", "Secret", "Top", "Guess"].any? { |word| record.title.include?(word) }
      record.errors[:title] << "is not clickbaity"
    end
  end
end
