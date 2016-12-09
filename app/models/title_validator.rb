class TitleValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)

    unless value =~ /\bSecret\b|\bWon't\b\s\bBelieve\b|\bGuess\b|\bTop [1-9]\b/ 
      record.errors[attribute] << (options[:message] || "not clickbait-y enough")
    end
  end

end
