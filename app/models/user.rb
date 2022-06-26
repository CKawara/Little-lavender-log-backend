class User < ActiveRecord::Base
    has_many :entries
    has_many :categories, through: :entries
end