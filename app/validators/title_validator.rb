class TitleValidator < ActiveModel::EachValidator
  def validate_each(post, title, value)
    clickbait_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    post.errors.add title unless !post.title.nil? && clickbait_array.any? {|clickbait| value.include?(clickbait) }
  end
end
