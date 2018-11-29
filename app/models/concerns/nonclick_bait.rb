class NonClickbait < ActiveModel::Validator
  def validate(record)
    unless record.title.to_s.include?("Won't Believe" || "Secret" || "Top /\d/" || "Guess")
        record.errors.add(:title, "Title must be clickbait")
    end
  end
end
