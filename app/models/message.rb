class Message < ActiveRecord::Base
    belongs_to :user #belongs to reciever
end