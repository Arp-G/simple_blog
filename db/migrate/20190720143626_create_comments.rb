class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :writter
      t.string :content
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
