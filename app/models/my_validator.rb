class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title != nil
      unless post.title.include? "Won't Believe"
        post.errors[:title] << 'false'
      end
   end
 end
end
