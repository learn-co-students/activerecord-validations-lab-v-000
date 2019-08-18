class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.include? "Won't Believe" || "Secret" || "Top
[number]" || "Guess"
      record.errors[:name] << 'Clickbait'
    end
  end
end
