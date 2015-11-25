class PhotoShoutsController < ApplicationController
  def create
    unless new_shout.save
      flash.alert = "Could not shout."
    end
    redirect_to dashboard_path
  end

  private

  def new_shout
    current_user.shouts.build(content: build_content)
  end

  def build_content
    PhotoShout.new(photo_shout_parameters)
  end

  def photo_shout_parameters
    params.require(:photo_shout).permit(:image)
  end
end
