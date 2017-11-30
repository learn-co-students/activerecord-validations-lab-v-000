class MyValidator < ActiveModel::Validator
  def validate(record)
    unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|c| record.title.include?(c) if record.title}
      record.errors[:name] << 'Not click-baty enough'
    end
  end
end
