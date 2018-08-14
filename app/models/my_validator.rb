class MyValidator < ActiveModel::Validator

  def validate(post_instance)
    clicky = %w(Won't Believe Secret Top Guess)
    title = post_instance.title

    if title
      unless title.split(" ").any? { |t| clicky.include?(t) }
        post_instance.errors.add(:title, "Title must be clickbait")
      end
    end
  end

end
