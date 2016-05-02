class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  #only these options: inclusion validator
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

  validate :clickbaity

  #clicky
  def clickbaity
    if title != nil && !self.title.include?("Won't Believe" || "Secret" || "Top
[number]" || "Guess")
    errors.add(:title, 'Need a clickbaity title!!!')
    end
  end



  
end
