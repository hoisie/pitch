class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name, :null=>false
      t.text :subject, :null=>false
      t.text :content, :null=>false
      t.references :identity, :null=>false
      t.references :user, :null=>false
      t.timestamps
    end
  end
end
