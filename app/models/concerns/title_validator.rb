    class TitleValidator < ActiveModel::Validator
      def validate(post)
        valid = ["Won't Believe", "Secret", "Top", "Guess"]
        if post.title
            unless valid.any? {|word| post.title.include?(word)}
                post.errors[:title] << 'Need to include clickbait keywords'
            end
        end
      end
    end