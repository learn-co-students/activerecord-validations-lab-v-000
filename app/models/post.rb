class MyValidator < ActiveModel::Validator

  def validate(post)
    if post.title != nil
      unless post.title.include?("Won't Believe")
        post.errors[:title] << "Not Clickbait"
      end
    end
  end

end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250}})
  validates(:summary, { :length => { :maximum => 250}})
  validates(:category, inclusion: { in: %w(Fiction Non-Fiction)})
  validates_with MyValidator
end
