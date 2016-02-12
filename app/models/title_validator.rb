class TitleValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless !!value && value.include?( "Won't Believe" || "Secret" || "Top" || "Guess" )
      record.errors[attribute] << (options[:message] || "must include clickbait-y title" )
    end
  end
end