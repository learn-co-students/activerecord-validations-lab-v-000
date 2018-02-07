class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.include?("Won't Believe") || value.include?("Secret") || value.include?("Top" + "#{/\d/}") || value.include?("Guess")
      record.errors[attribute] << (options[:message] || "Title must be clickbait-y")
    end
  end
end
