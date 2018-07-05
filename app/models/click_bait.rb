class ClickBait < ActiveModel::Validator
  def validate(record)
    if

    record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess")
    #["Won't Believe", "Secret", "Top", "Guess"].any? {|b| (record.title).include? b}
      record.errors[:title] << "Edit the title to make it click-baity!"
    end
  end

end
