
class ClickBait < ActiveModel::Validator
  
  def validate(title)
    # https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
    # must contain one of the following: "Won't Believe", "Secret", "Top [number]", or "Guess"
    unless title.include?
      record.errors[
    end
  end
  
end