# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    
    validates :short_url, uniqueness: true
    validates :long_url, presence: true

    def self.random_code
        rcode = SecureRandom::urlsafe_base64
        while ShortenedUrl.exists?(rcode) 
            rcode  = SecureRandom::urlsafe_base64
        end
        rcode
    end

    def create_short_url(user, long_url_str)
        short_url_str = ShortenedUrl.random_code
        ShortenedUrl.new(long_url: long_url_str,short_url: short_url_str )
    end
end
