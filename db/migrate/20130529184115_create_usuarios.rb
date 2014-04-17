class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.integer :curso_id
      t.integer :matricula
      t.boolean :administrador

      t.timestamps
    end
  end
end
