class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos, {:id => false, :primary_key => 'matricula'}  do |t|
      t.integer :matricula, :null => false
      t.string :nome
      t.string :curso
      t.string :matriz_curso
      t.float :p
      t.float :ti
      t.float :ta
      t.float :qr
      t.float :mra
      t.float :mga
      t.float :mgc

      t.timestamps
    end
    execute "ALTER TABLE alunos ADD PRIMARY KEY (matricula);"
  end
end
