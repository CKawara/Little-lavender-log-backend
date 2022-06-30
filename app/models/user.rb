class User < ActiveRecord::Base
    has_many :entries
    has_many :categories, through: :entries
    has_secure_password


    def self.get_user(name)
        self.where(name: name)
    end
end