json.array!(@menus) do |menu|
  json.extract! menu, :restaurant_name, :description, :image_url
  json.url menu_url(menu, format: :json)
end
