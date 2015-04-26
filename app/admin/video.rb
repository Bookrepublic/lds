ActiveAdmin.register Video do

  permit_params :title, :description, :video, tag_ids: [], pubblication_ids: []

  form do |f|
    f.inputs 'Video details' do
      f.input :title
      f.input :description
      f.input :video
    end
    f.inputs "Risorse collegate" do
      f.input :tags, as: :check_boxes, label: 'Categorie', collection: Tag.order("tag ASC").all
      f.input :pubblications, as: :check_boxes, label: 'Libri', collection: Pubblication.order("title ASC").all
      f.input :writers, as: :check_boxes, label: 'Autori', collection: Writer.order("last_name ASC").all
    end
    f.inputs "Risorse di Libreria degli scrittori" do
      f.input :books, as: :check_boxes, label: 'Libri di LDS', collection: Book.order('title ASC').all
    end
    f.actions
  end
end
