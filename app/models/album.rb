class Album < ApplicationRecord
    belongs_to :user
    has_one_attached :cover_photo
    has_many_attached :photos

    has_many :taggings,dependent: :destroy
    has_many :tags, through: :taggings



    def all_tags=(names)
        self.tags = names.split(",").map do |name|
          Tag.where(name: name).first_or_create!
        end
      end
    
      def all_tags
        tags.map(&:name).join(", ")
      end




    
end


