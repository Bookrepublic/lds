ActiveAdmin.register Tag do
  menu label: "Categorie per video e post"
  index do
    selectable_column
    column 'Tags', sortable: :tag do |tag|
      link_to tag.tag, admin_tag_path(tag)
    end
    actions
  end

  permit_params :tag

  filter :tag

  form do |f|
    f.inputs 'Tags detail' do
      f.input :tag
    end
    f.actions
  end
end
