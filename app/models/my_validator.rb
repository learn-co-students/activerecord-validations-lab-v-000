class MyValidator < ActiveModel::Validator
    def validate(post)
        unless post.title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
            post.errors[:title] << 'false'
        end
    end
end