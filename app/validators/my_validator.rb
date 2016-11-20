class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title == nil ||
           record.title.include?("Won't Believe") ||
           record.title.include?("Secret") ||
           record.title.include?("Top [number]") ||
           record.title.include?("Guess")
      record.errors[:title] << 'Insufficiently clickbaity title!'
    end
  end
end