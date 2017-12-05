require 'pry'

class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title
          words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless words.any? { |word| record.title.include?(word) }
          record.errors[:base] << (options[:message] || "is not clickbait")
        end
    end
    false
  end
end