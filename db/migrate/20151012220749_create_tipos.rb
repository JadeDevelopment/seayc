class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.text :NombreTipo

      t.timestamps 
    end
  end
end