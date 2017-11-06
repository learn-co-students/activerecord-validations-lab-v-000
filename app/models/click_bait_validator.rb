class ClickBaitValidator < ActiveModel::EachValidator
  def validate_each(post, title, value)
    if !value.nil?
      unless value["Won't Believe"] || value["Secret"] || value["Top"] || value["Guess"]
        post.errors[title] << 'Post title needs to be click bait!'
      end
    end
  end
end
