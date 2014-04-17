class Disciplina < ActiveRecord::Base
  attr_accessible :curso_id, :nome
  belongs_to :curso
  has_many :turmas_solicitacaos
  has_many :solicitacaos, :through => :turmas_solicitacaos
  has_many :turmas, :dependent => :destroy
end
