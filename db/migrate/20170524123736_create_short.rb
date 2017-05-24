class CreateShort < ActiveRecord::Migration[5.0]
  def change
    create_table :shorts do |t|
      t.string :add
      t.string :url
    end
  end
end
