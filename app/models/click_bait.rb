class ClickBait < ActiveModel::Validator
  def validate(post)
    unless
    ["Won't Believe", "Secret", "Top", "Guess"].any? {|b| post.title.include? b}
      post.errors[:title] << "Add "Won't believe", "Secret", "Top [number]" or "Guess" to make your title click-baity!"
    end
  end
end
