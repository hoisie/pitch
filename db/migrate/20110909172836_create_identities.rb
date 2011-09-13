class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :email, :null=>false
      t.string :name, :null=>false
      t.text :signature, :null=>false
      t.references :user, :null=>false
      t.timestamps
    end
  end
end
