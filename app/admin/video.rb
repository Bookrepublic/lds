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

  permit_params(
    :title, :description, :video,
    sponsor_ids: [], writer_ids: [], book_ids: [],
    tags_attributes: {tag: nil, _destroy: nil, id: nil},
    pubblications_attributes: {title: nil, _destroy: nil, id: nil},
  )

  form do |f|
    f.inputs 'Video details' do
      f.input :title
      f.input :description
      f.input :video
    end
    f.inputs "Consigliatori" do
      f.input :sponsors, as: :check_boxes, label: 'Consigliatori', collection: Sponsor.order("last_name ASC").all
    end
    f.inputs "Risorse collegate" do
      #f.input :pubblications, as: :check_boxes, label: 'Libri', collection: Pubblication.order("title ASC").all
      f.input :writers, as: :check_boxes, label: 'Autori', collection: Writer.order("last_name ASC").all
      f.has_many :pubblications, allow_destroy: true, new_record: true do |p|
        p.input :title
      end
    end
    f.inputs "Categorie" do
      f.has_many :tags, allow_destroy: true, new_record: true do |t|
        t.input :tag
      end
    end
    f.inputs "Risorse di Libreria degli scrittori" do
      f.input :books, as: :check_boxes, label: 'Libri di LDS', collection: Book.order('title ASC').all
    end
    f.actions
  end

  controller do
    def update
      return super if ! params[:video]
      return super if ! params[:video][:tags_attributes]
      return super if ! params[:video][:pubblications_attributes]
      video = Video.find(params[:id])
      attribs = params[:video].delete(:tags_attributes)
      attribs_pubblication = params[:video].delete(:pubblications_attributes)
      handle_tagging video, attribs
      handle_tagging_pubblication video, attribs_pubblication
      super
    end

    private

    # Manually handle tag association.
    # Example tags_attributes:
    #     tags_attributes: {
    #       "0" => {tag: "Tag 1", "_destroy"=>"1", "id"=>"2"},
    #       "1" => {tag: "Tag 3", "_destroy"=>"0", "id"=>"4"},
    #       "2" => {tag: "Tag"}
    #     }
    def handle_tagging(object, attribs)
      attribs.each do |i, a|
        if a.include?(:id)
          tag = object.tags.find(a[:id])
          if a[:_destroy] == "1"
            object.tags.destroy(tag)
          else
            if tag.tag != a[:tag]
              # an existing tag has been edited - substitute
              object.tags.destroy(tag)
              add_tag_if_missing object, a[:tag]
            end
          end
        else
          add_tag_if_missing object, a[:tag]
        end
      end
    end

    def add_tag_if_missing(object, tagname)
      tag = Tag.where(tag: tagname).first_or_create!
      if ! object.tags.include?(tag)
        object.tags << tag
      end
    end

    def handle_tagging_pubblication(object, attribs)
      attribs.each do |i, a|
        if a.include?(:id)
          pubblication = object.pubblications.find(a[:id])
          if a[:_destroy] == "1"
            object.pubblications.destroy(pubblication)
          else
            if pubblication.title != a[:title]
              # an existing tag has been edited - substitute
              object.pubblications.destroy(pubblication)
              add_pubblication_if_missing object, a[:title]
            end
          end
        else
          add_pubblication_if_missing object, a[:title]
        end
      end
    end

    def add_pubblication_if_missing(object, pubname)
      pubblication = Pubblication.where(title: pubname).first_or_create!
      if ! object.pubblications.include?(pubblication)
        object.pubblications << pubblication
      end
    end
  end
end
