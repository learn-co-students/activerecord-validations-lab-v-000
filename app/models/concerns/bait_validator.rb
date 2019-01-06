class BaitValidator < ActiveModel::Validator

  def validate(obj)
    options = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if !obj.title.nil? && options.map { |check|  obj.title.include?(check) }.include?(true)
      true
    else
     obj.errors[:title] << 'The title needs to be clickbait'
    end
  end

 end
