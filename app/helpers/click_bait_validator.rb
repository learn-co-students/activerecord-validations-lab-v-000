class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
    if !record.title.nil? && !record.title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      record.errors[:base] << "You have to sell your soul for clicks!"
    end
  end
end