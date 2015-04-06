class ImagesController < ApplicationController
  def create
    @image = Image.create(create_params)
    if @image.errors.empty?
      redirect_to @image, notice: 'Img was successfully created.'
    else
      render action: 'new'
    end
  end

  def post_image_create
    @image = Image.create(post_image_create_params)
    if @image.errors.empty?
      render text: @image.img.url
    else
      render action: 'new'
    end
  end

  private

  def create_params
    params.require(:image).permit(:img)
  end

  def post_image_create_params
    {img: params.require(:file)}
  end
end
