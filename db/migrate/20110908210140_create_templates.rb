class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name, :null=>false
      t.text :subject, :null=>false
      t.text :content, :null=>false
      t.references :identity
      t.timestamps
    end
  end
end
