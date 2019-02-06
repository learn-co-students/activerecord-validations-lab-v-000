  class MyValidator < ActiveModel::Validator
def validate(record)
keywords= [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  
   if !keywords.any? { |keyword| :title.include?(keyword) if :title }
      record.errors.add(:title, "is not clickbait-y")
    end
  end
end