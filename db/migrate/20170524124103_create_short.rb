class CreateShort < ActiveRecord::Migration[5.0]
  def change
    create_table :shorts do |t|
      t.string :url
      
      t.timestamps
    end
  end
end
