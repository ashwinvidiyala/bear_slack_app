Rails.application.routes.draw do
  controller :open_note do
    post 'open_note'
  end

  controller :open_bear do
    post 'open_bear'
  end

  controller :open_tag do
    post 'open_tag'
  end

  controller :grab_url do
    post 'grab_url'
  end
end
