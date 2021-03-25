# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Song < ApplicationRecord
    validates :body, presence: true


    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :likes,
        primary_key: :id,
        foreign_key: :song_id,
        class_name: :Llike 

    has_many :likers,
        through: :likes,
        source: :liker
end
