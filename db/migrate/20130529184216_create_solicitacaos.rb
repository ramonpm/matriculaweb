class CreateSolicitacaos < ActiveRecord::Migration
  def change
    create_table :solicitacaos do |t|
      t.integer :usuario_id
      t.string :observacao
      t.integer :status

      t.timestamps
    end
  end
end
