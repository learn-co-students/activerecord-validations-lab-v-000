class Clickbait < ActiveModel::Validator
  def validate(record) 
    unless record.title.nil?
      clicks = [/Won't Believe/, /Secret/, /Guess/, /[Top]+\s+\d*/]
      re = Regexp.union(clicks)
      unless record.title.match(re) 
        record.errors[:title] << "Needs to be more clickbaity"
      end
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
  validates :title, presence: true

end
  
  
