text "Ajuste de Matrícula", :size => 20, :style => :bold

move_down 30

text 'Número:	' + @solicitacao.id.to_s

move_down 10

text 'Aluno:	' + @solicitacao.usuario.nome

move_down 10

text 'Curso:	' + @solicitacao.usuario.curso.nome

move_down 10

text 'Matrícula:	' + @solicitacao.usuario.matricula.to_s

move_down 10

text 'E-mail:	' + @solicitacao.usuario.email

move_down 30

table [[@items]], :header => true

move_down 30

text 'Observação: ' + @solicitacao.observacao

move_down 100

stroke do
  horizontal_line 100, 440
end
move_down 10
text 'Data:	' + @solicitacao.created_at.strftime("%d/%m/%Y, %I:%M%p") + '   ' + @solicitacao.usuario.nome, :align => :center

