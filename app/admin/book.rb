ActiveAdmin.register Book do

  permit_params :title, :description, :price, :pages, :isbn, :pubblication_date, :link_bookrepublic, :link_amazon, :link_kobo, :link_apple, :cover, collection_ids: [], author_ids: []

  form do |f|
    f.inputs "Book details" do
      f.input :title
      f.input :description
      f.input :isbn
      f.input :pages
      f.input :pubblication_date, as: :date_select, start_year: 2000
    end
    f.inputs "Authors" do
      f.input :authors, as: :check_boxes
    end
    f.inputs "Collection" do
      f.input :collection
    end
    f.inputs "Price" do
      f.input :price
    end
    f.inputs "Cover" do
      f.input :cover, as: :file
    end
    f.inputs "Store" do
      f.input :link_bookrepublic
      f.input :link_amazon
      f.input :link_apple
      f.input :link_kobo
    end
  end

end
