class TitleIsClickbaityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe/i || value =~ /Secret/i || value =~ /Guess/i || value =~ /Top \d/i
      record.errors[attribute] << "must have a clickbaity title."
    end
  end
end