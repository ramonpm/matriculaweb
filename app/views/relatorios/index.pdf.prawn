pdf.text "Todas as Solicitações", :size => 20, :style => :bold

pdf.move_down(30)

pdf.table([[@items]])
