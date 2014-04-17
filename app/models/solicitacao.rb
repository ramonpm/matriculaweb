class Solicitacao < ActiveRecord::Base
  attr_accessible :usuario_id, :observacao, :turmas_solicitacaos_attributes, :status
  has_many :turmas_solicitacaos
  has_many :turmas, :through => :turmas_solicitacaos
  has_many :disciplinas, :through => :turmas_solicitacaos
  belongs_to :usuario

  accepts_nested_attributes_for :turmas_solicitacaos, :allow_destroy => true
end
