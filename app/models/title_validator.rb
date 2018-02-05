
class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ "Won't Believe" || value == "Secret" || value == "Top [0-100]" || value == "Guess"
      record.errors[attribute] << (options[:message] || "is not click-baity enough")
    end
  end
end