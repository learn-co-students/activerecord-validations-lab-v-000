class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && value.match(/Won\'t Believe|Secret|Guess|Top \d+/)
      record.errors[attribute] << (options[:message] || "Not clickbait-y enough")
    end
  end
end
