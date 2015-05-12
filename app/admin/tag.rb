ActiveAdmin.register Tag do
  menu parent: 'Video', label: 'Categorie'

  index do
    selectable_column
    column 'Tags', sortable: :tag do |tag|
      link_to tag.tag, admin_tag_path(tag)
    end
    actions
  end

  permit_params :tag

  filter :tag

  action_item :view, only: :show do
    link_to 'New tag', new_admin_tag_path
  end

  form do |f|
    f.inputs 'Tags detail' do
      f.input :tag
    end
    f.actions
  end
end
