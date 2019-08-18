class PostValidator < ActiveModel::Validator
  def validate(r)
    if r.title
      #binding.pry
      r.errors[:name] << 'Clickbaity' unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|w| r.title.include?(w)}
    end
  end
end
