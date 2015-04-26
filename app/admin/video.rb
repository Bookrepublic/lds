ActiveAdmin.register Video do
  menu parent: 'Video', label: "Video"

  index do
    selectable_column
    column 'Title', sortable: :title do |video|
      link_to video.title, admin_video_path(video)
    end
    column :created_at, sortable: :created_at
  end

  filter :title
  filter :pubblications
  filter :writers
  filter :books
  filter :authors
  filter :created_at

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
