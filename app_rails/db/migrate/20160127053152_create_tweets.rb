class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
