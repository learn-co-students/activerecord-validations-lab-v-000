require 'pry'

class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title.nil?
      record.errors[:title] << 'Must have a title'
    else
     unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|click_bait| record.title.include?(click_bait) } 
      record.errors[:title] << 'We demand click-bait!'
     end 
    end
  end
end
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, :in => ["Fiction",  "Non-Fiction"]
  validates_with MyValidator
end
