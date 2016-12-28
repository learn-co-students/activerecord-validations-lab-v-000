class MyValidator < ActiveModel::Validator
  # def validate_title(record, attribute, value)
  #   unless record.title =~ /Top [0-9]/i
  #     record.errors[attribute] << (options[:message] || "is not a valid title")
  # end

  # a =~ /Top [0-9]/

  def validate(record)
    unless record.title.include?("Won't Believe", "Secret", "Guess", title)
      record.errors[:name] << "Not a valid title"
    end
  end


end
