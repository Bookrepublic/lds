ActiveAdmin.register Author do

  permit_params :first_name, :last_name, :biography

  form do |f|
    f.inputs 'Author details' do
      f.input :first_name
      f.input :last_name
      f.input :biography
    end
    f.actions
  end

end
