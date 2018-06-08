require 'pry'

class ClickBaitValidator < ActiveModel::Validator

  def validate(record)

    if record.title 
      
      unless   record.title.include?("Won't Believe") 
        record.errors[:title] << "Need a more clickbait-y title please!"
      end
  end 
end
end




class Post < ActiveRecord::Base



  validates :title, presence: true


  include ActiveModel::Validations
  validates_with ClickBaitValidator


  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 200}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate

end


