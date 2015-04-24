ActiveAdmin.register Collection do
  menu label: 'Collane'

  index do
    selectable_column
    column "Collection Name", sortable: :name do |collection|
      link_to collection.name, admin_collection_path(collection)
    end
    actions
  end

  permit_params :name

  filter :name

  form do |f|
    f.inputs 'Collection details' do
      f.input :name
    end
    f.actions
  end

end
