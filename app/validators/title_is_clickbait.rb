
class TitleIsClickBaitValidator < ActiveModel::Validator
  def validate(record)
    if self.title != nil && self.title != ""
      self.title.split.include?("Won't") ||
      self.title.split.include?("Secret") ||
      self.title.split.include?("Top") ||
      self.title.split.include?("Guess")
    end
  end
end
