class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-fiction)}
    validate :clickbait

    def clickbait
        if self.title
        title_array = self.title.split
        test_array = ["Won't", "Believe", "Secret", "Top [number]", "Guess"]
        #  binding.pry
            if !title_array.any?{|word| test_array.include?(word) }
            errors.add(:clickbait, "true")
            end
                   
        end        
    end
    
end
