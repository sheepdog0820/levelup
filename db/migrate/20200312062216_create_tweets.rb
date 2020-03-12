class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :image
      t.references :user, type: :bigint, foreign_key: true
      t.timestamps
    end
  end
end
