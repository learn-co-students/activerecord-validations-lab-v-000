# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.title.include?("Won't Believe") || record.title.include?("Top") ||record.title.include?("Secret") ||record.title.include?("Guess")
#       record.errors[:title] = false
#     end
#   end
# end

class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.nil?
      unless value.include?("Won't Believe") || value.include?("Top") || value.include?("Secret") || value.include?("Guess")
        record.errors[attribute] = false
      end
  end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
