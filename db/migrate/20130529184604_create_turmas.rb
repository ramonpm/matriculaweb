class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :dias_horarios

      t.timestamps
    end
  end
end
