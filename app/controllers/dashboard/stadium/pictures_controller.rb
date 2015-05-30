class Dashboard::Stadium::PicturesController < Dashboard::PicturesController
  prepend_view_path 'app/views/dashboard'
  def self.controller_path
    "dashboard/pictures"
  end
end