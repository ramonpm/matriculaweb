class TurmasSolicitacao < ActiveRecord::Base
  attr_accessible :turma_id, :solicitacao_id, :disciplina_id, :acao # 0 incluir, 1 excluir
  belongs_to :solicitacao
  belongs_to :turma
  belongs_to :disciplina
end
