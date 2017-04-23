class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: ['Fiction', 'Non-Fiction']
  validate :cb
  def cb
    if title==nil then errors.add(:title, "absence") 
  elsif title.match("Won't Believe")==nil && title.match("Secret")==nil && title.match(/Top[0-9]/)==nil then errors.add(:title, "not click-baity") end
  end
end
