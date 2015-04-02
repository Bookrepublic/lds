ActiveAdmin.register Author do

  permit_params :first_name, :last_name, :biography, :avatar

  form do |f|
    f.inputs 'Author details' do
      f.input :first_name
      f.input :last_name
      f.input :biography
    end
    f.inputs 'Author image' do
      f.input :avatar, as: :file
    end
    f.actions
  end

end
