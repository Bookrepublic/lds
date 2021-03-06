ActiveAdmin.register Sponsor do
  menu parent: 'Video', label: 'Consigliatori'

  index do
    selectable_column
    column 'Last name', sortable: :last_name do |sponsor|
      link_to sponsor.last_name, admin_sponsor_path(sponsor)
    end
    column :first_name, sortable: :first_name
    actions
  end

  filter :last_name
  filter :first_name
  filter :videos

  permit_params :last_name, :first_name, :biography, video_ids: []

  action_item :view, only: :show do
    link_to 'New sponsor', new_admin_sponsor_path
  end

  form do |f|
    f.inputs 'Sponsor details' do
      f.input :first_name
      f.input :last_name
      f.input :biography
    end
    f.inputs 'Sponsor image' do
      f.input :avatar, as: :file
    end
    f.actions
  end
end
