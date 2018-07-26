class Clickbait < ActiveModel::Validator
  def validate(record) 
    unless ["Won't Believe", "Secret", /[Top]+\s+\d*/, "Guess"].include? (record)
      record.errors[:title] << "Needs to be more clickbaity"
    end
  end
end




class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with Clickbait
  
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 } 
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validates :category, exclusion: { in: [nil] }

end
  
  
