
class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title.include?("Won't Believe", "Secret", "Top [number]", "Guess")
    #  record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end
