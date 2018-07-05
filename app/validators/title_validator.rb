class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(?i)won't believe|top \d|secret|guess/
      record.errors[attribute] << (options[:message] || "is not clickbait-y")
    end
  end

end
