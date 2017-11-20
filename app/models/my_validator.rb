class MyValidator < ActiveModel::Validator

  def validate(post)
    if post.title
      post.title.include?("won't believe") || post.title.include?("secret") || post.title.include?("Top") || post.title.include?("Guess")
    end
  end
end
