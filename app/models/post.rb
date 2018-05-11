class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :summary, length: { maximum: 50 } 
    validates :content, length: { minimum: 20 }
    validate :title_validator
    
    def title_validator
        @post = Post.last
        a = @post.title.scan(/(Secret) | (Guess) | (Won't Believe) | (Top)\s[1-9] | (Top)\s[1-9][1-9]/)  
        if a == true
            @post.title
        end
        # |v| v =~ /[aeiou]/ }  #=> ["a", "e"]
        
    end

    # class MyValidator < ActiveModel::Validator
    #     def validate(record)
    #       unless record.title.include?( "Won't Believe" | "Secret" | "Top [0-9]" | "Guess" )
    #         record.errors[:title] << 'Need a valid title'
    #       end
    #    end
    # end
       

    # class TitleValidator < ActiveModel::EachValidator
    #     def validate_each(title)
    #       unless title.include?( "Won't Believe" | "Secret" | "Top#{Integer}" | "Guess" )
    #         record.errors[:title] << (options[:message] || "is not a valid title")
    #       end
    #     end
    # end

    # class Post < ApplicationRecord
    #     validates :title, presence: true, title: true
    # end
end
