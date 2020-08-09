class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.text :name
      t.text :bio
      t.text :image

      t.timestamps
    end
  end
end
