class PostTitleValidator < ActiveModel::Validator
  def validate(record)
    t = record.title
    t = 'a' if t == nil
    unless (["Won't Believe", "Secret", "Guess", (/Top \d+/).to_s].any? { |s| t.include? s })

      record.errors[:name] << 'Post title must exist and be clickbaity!!'
    end
  end
end
