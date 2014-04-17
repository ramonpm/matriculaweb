#!/bin/env ruby
# encoding: utf-8
class Usuario < ActiveRecord::Base
  msg = "inválido"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :administrador, :curso_id, :matricula, :nome
  validates_presence_of :nome, :message => msg
  validates_presence_of :curso_id, :message => msg
  validates_presence_of :matricula, :message => msg
  belongs_to :curso
  belongs_to :aluno, :foreign_key => "matricula"
  has_many :solicitacaos, :dependent => :destroy
end
