ActiveAdmin.register Author do
  menu label: "Autori"

  index do
    selectable_column
    column "Last name", sortable: :last_name do |author|
      link_to author.last_name, admin_author_path(author)
    end
    column :first_name
    actions
  end
  permit_params :first_name, :last_name, :biography, :avatar, :public

  filter :last_name
  filter :first_name

  form do |f|
    f.inputs 'Author details' do
      f.input :first_name
      f.input :last_name
      f.input :biography
    end
    f.inputs 'Author image' do
      f.input :avatar, as: :file
    end
    f.inputs 'Pubblico?' do
      f.input :public
    end
    f.actions
  end

end
