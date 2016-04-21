class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
    if !record.title.nil?
      unless record.title.include?("Won't Believe" || "Secret" || /([Top]\s\d+)/ || "Guess")
        record.errors.add(:title, "C'mon, you can do better than that.")
      end
    end
  end
end