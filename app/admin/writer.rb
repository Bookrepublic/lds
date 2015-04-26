ActiveAdmin.register Writer do
  menu parent: 'Video', label: 'Autori consigliati'

  index do
    selectable_column
    column 'Last name', sortable: :last_name do |writer|
      link_to writer.last_name, admin_writer_path(writer)
    end
    column :first_name, sortable: :first_name
  end

  filter :last_name
  filter :videos
  filter :pubblications

  permit_params :last_name, :first_name, pubblication_ids: []

  form do |f|
    f.inputs 'Writer details' do
      f.input :first_name
      f.input :last_name
      f.input :pubblications, as: :check_boxes, label: 'Pubblicazioni', collection: Pubblication.order('title ASC').all
    end
    f.actions
  end
end
