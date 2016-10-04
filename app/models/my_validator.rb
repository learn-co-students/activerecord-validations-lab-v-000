class MyValidator < ActiveModel::EachValidator
  def validate(record)
    # keywords = %w(Wont Believe Secrete Top Guess)
  
    # if record.split.any? { |el| keywords.include?(el) }
    #   true 
    # else
    #   record.errors[:title] << 'Not clickbait-y enough!'
    # end
  end
end
 
