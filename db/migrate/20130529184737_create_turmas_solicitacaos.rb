class CreateTurmasSolicitacaos < ActiveRecord::Migration
  def change
    create_table :turmas_solicitacaos do |t|
      t.integer :acao	
      t.integer :turma_id
      t.integer :solicitacao_id
      t.integer :disciplina_id

      t.timestamps
    end
  end
end
