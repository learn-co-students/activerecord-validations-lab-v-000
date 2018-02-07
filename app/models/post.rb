class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.include? "Won't Believe" || "Secret" || "Top" || "Guess"
        record.errors[:title] << 'Not Clickbait'
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, :inclusion => { :in => ["Fiction", "Non-Fiction"] }
  validates_with MyValidator
end



# If the title does not contain "Won't Believe", "Secret", "Top
# [number]", or "Guess", the validator should return false.
