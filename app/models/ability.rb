class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= Usuario.new # guest user (not logged in)
    if user.matricula == 81720 then
        can :manage, :all
    end
    if user.administrador?
        can :manage, Solicitacao
        can :manage, Relatorio
        can :manage, Curso
        can :manage, Disciplina
        can :manage, TurmasSolicitacao
        can :manage, Turma
        can [:import, :import_page, :index], [Aluno]
    else
        can :manage, Solicitacao
        can [:new, :create, :sign_in, :sign_up], [Usuario]
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
