class CreateMessagesTable < ActiveRecord::Migration[4.2]
    def change
        create_table :messages do |t|
            t.string :content
            t.string :sent_at
            t.integer :user_id #sender
        end
    end
end