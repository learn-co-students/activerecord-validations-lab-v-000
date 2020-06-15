class PostValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      record.errors[:name] << 'Clickbaity' unless [ "Won't Believe", "Secret", "Top", "Guess"].any? {|word| record.title.include?(word)}
    end
  end
end
