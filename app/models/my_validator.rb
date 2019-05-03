class MyValidator < ActiveModel::Validator
  def clickbait?(post)
    unless post.title.include?("Won't Believe")||
      post.title.include?("Secret") ||
      post.title.include?("Top [number]") ||
      post.title.include?("Guess")
      # post.errors[:title] << 'Need one of these!'
    end
  end
end
