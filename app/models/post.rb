class MyValidator  < ActiveModel::Validator
  def validate(post)
    if post.title
      unless (post.title.include? ("Won't Believe") )||  (post.title.include? ("Secret")) || (post.title.include? ("Top [number]")) || (post.title.include? ("Guess"))
        post.errors[:title] << "Not clickbait-y enough"
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true

  include ActiveModel::Validations
  validates_with MyValidator


  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

end
