# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord


    #want to check we only have one username per user   
    validates :username, presence: true, uniqueness: true


    has_many :songs, 
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Song
        
    has_many :likes, 
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like

    has_many :liked_songs,
        through: :likes,
        source: :song
end
