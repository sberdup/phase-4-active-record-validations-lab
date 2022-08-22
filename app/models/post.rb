class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion:{in: ["Fiction","Non-Fiction"]}
    validate :no_clickbait 

    def no_clickbait
        if title == 'True Facts'
            errors.add(:title, 'Not allowed.')
        end
    end

end
