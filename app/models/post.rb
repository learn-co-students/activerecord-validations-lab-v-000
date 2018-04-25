class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title != nil
      if record.title.include? "Won't Believe"
      elsif record.title.include? "Secret"
      elsif record.title.include? "Guess"
      elsif record.title.include? "Top"
        x = record.title.split("Top")
        counter = false
        x.each do |int|
          if int.to_i != nil
            counter == true
          end
        end
        if counter == false
          record.errors[:title] << 'clickbait-y'
        end
      else
        record.errors[:title] << 'clickbait-y'
      end
    else
      record.errors[:title] << 'No title given'
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  include ActiveModel::Validations
  validates_with MyValidator
end
