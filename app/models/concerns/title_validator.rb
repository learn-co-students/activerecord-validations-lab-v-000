class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title != nil
      if !record.title.include? "Won't Believe"
        record.errors[:title] << 'Title not valid.'
      end
    else
      record.errors[:title] << 'Title is empty.'
    end
  end
end
