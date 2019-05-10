class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(post, attribute, value)
    unless value =~ /\b(Won't Believe|Secret|Top|Guess)\b/
      post.errors[attribute] << (options[:message] || "is not sufficiently clickbait-y")
    end

  end
end
