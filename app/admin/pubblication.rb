ActiveAdmin.register Pubblication do
  menu parent: 'Video', label: 'Libri consigliati'

  index do
    selectable_column
    column 'Title', sortable: :title do |pubblication|
      link_to pubblication.title, admin_pubblication_path(pubblication)
    end
  end

  filter :title
  filter :videos
  filter :writers

  permit_params :title, writer_ids: []

  form do |f|
    f.inputs 'Pubblication details' do
      f.input :title
      f.input :writers, as: :check_boxes, label: 'Autori', collection: Writer.order('last_name ASC').all
    end
    f.actions
  end
end
