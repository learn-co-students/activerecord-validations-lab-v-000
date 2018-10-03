class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
   validate(:title)




  def validate(record)
    validates :record, inclusion: { in: ["Won't Believe", "Secret", "Top [number]", "Guess"]}
  end
  #binding.pry
end
