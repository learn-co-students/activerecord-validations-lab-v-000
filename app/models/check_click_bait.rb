class CheckClickBait < ActiveModel::Validator
  
  @@clickbait_patterns = [/Won't Believe/i, /Secret/i, /Top [0-99]/i, /Guess/i]
  
  def validate(record)
    unless @@clickbait_patterns.any? { |pattern| pattern.match record.title }
      record.errors[:title] << "Not clickbait-y enough. Must include: Won't Believe, Secret, Top [0-99], or Guess."
    end
  end
  
end
  