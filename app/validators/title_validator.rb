class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    #binding.pry
    if record.title.present? && !record.title.include?("Won't Believe")
      record.errors[:title] << 'Need a title that is clickbait-y'
    elsif record.title.present? && record.title.include?("Won't Believe")
      true 
    elsif record.title.present? && !record.title.include?("Secret")
      record.errors[:title] << 'Need a title that is clickbait-y'
    elsif record.title.present? && !record.title.include?("Top[number]")
      record.errors[:title] << 'Need a title that is clickbait-y'
    elsif record.title.present? && !record.title.include?("Guess")
      record.errors[:title] << 'Need a title that is clickbait-y'
    else
      true
    end
  end
end
