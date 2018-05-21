class MyValidator < ActiveModel::Validator
  def validate(post)
    if  post.title == nil
      post.errors[:title] << "Title can't be nil"
    elsif post.title.starts_with? 'True'
      post.errors[:title] << "Must be click bait"
    else
      post.errors[:title]
    end
  end
end



class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: { minimum: 150 }
 validates :summary, length: { minimum: 5 }
   validates :summary, length: { maximum: 150 }
   validates_exclusion_of :category, :in => ["Bowling Ball"]
   validates_with MyValidator


end
