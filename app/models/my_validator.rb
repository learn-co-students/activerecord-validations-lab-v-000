class MyValidator < ActiveModel::Validator
  def validate(post)
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    if post.title && clickbait.none? { |phrase| post.title.include?(phrase) }
      post.errors[:title] << "Need clickbait"
    end
  end
end
