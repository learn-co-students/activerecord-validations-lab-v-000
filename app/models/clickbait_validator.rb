class ClickbaitValidator < ActiveModel::Validator
  def validate(post)
    if post.title
    unless post.title.include?("Won't Believe") || post.title.include?("Secret") || post.title.include?("Top [number]") || post.title.include?("Guess")
      return false
    end
  end
end
