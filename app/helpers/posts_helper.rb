module PostsHelper
  class TitleValidator < ActiveModel::Validator
    def validate(record)
    if record.title.nil?
      record.errors[:title] << "You need a title."
    elsif record.title.match(/(Won't Believe)|(Secret)|(Top \d)|(Guess)/).nil?
      record.errors[:title] << "Your title needs to be clickbait-y!"
    end 
   end
 end
end
