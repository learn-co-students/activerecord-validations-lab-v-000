class Author < ActiveRecord::Base
    validates :name, presence:true
    # validates :name, unique:true
    

    
end
