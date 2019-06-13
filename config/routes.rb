Rails.application.routes.draw do
  controller :open_note do
    post 'open_note'
  end

  controller :open_bear do
    post 'open_bear'
  end
end
