class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from, :null=>false
      t.string :to, :null=>false
      t.string :subject, :null=>false
      t.text :content, :null=>false
      t.references :user, :null=>false
      t.references :template, :null=>false
      t.references :identity, :null=>false
      t.timestamps
    end
  end
end
