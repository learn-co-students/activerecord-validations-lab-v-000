class MyValidator < ActiveRecord::Validator

  def validate(post)
    unless post.title.include? ("Won't Believe" || "Secret" || "Top"(/\d+/) || "Guess")
      post.errors[:title] << 'Need a clickbait title!' 
  end

end
