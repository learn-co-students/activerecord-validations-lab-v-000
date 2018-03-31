# class TitleValidator < ActiveModel::EachValidator
#   # def validate_each(record,attribute,value)
#   #    value.include?("Won't Believe") && value.include?("Secret") && value.include?("Top [number]") && value.include?("Guess")
#   # end
# end
class Post < ActiveRecord::Base
  validates :title, presence: true

  validates :content, length:{:minimum => 250}
  validates :summary, length:{:maximum => 250}
  validates :category, inclusion:{in: ["Fiction","Non-Fiction"]}
  validate :isclickbait
  def isclickbait
    if title == nil
      false
    elsif
      title.include?("Won't Believe") || title.include?("Secret") || title.match(/Top \d*/) || title.include?("Guess")
    else
      errors.add(:title, "title is not clickbaity enough")
     end
  end

end
