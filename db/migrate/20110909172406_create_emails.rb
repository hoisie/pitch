class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from, :null=>false
      t.string :to, :null=>false
      t.string :subject, :null=>false
      t.text :content, :null=>false
      t.references :identity
      t.references :template
      t.timestamps
    end
  end
end
