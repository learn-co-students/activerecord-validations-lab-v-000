class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title.starts_with? "Won't Believe" || unless post.title.starts_with? "Secret" || unless post.title.starts_with? "Top [number]" || unless post.title.starts_with? "Guess"
      record.errors[:title] << 'Need a name starting with X please!'
    end
  end
end