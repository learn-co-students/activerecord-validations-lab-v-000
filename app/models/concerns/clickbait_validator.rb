class ClickbaitValidator < ActiveModel::Validator
  
  def validate(post)
    patterns = %r{Won't Believe|Secret|Guess|Top [0-9]*}i
    if post.title !~ patterns
      post.errors.add :title, "Must be Clickbait!"
    end
  end
  
end
    
  
  