class MyValidator < ActiveModel::Validator

  def validate(record)
    record
    num = [0..9]
    record.title.starts_with?("Won't Believe", "Secret", "Top #{num}", "Guess")
   end

   

end
