class ClickBait < ActiveModel::Validator
  def validate(record)
    values = ["Won't Believe","Secret", "Top","Guess"]

      unless record.title && values.any? {|x| record.title.include?(x)} 
        record.errors[:title] << "Bad Title"
      end

  end
end