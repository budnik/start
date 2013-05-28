node[:nginx][:redirects].each do |app_name, app_attributes|
  nginx_redirect app_name do
    server_name           app_attributes[:server_name]
    listen                app_attributes[:listen]
    redirect_to_url       app_attributes[:redirect_to_url]
    action                app_attributes[:action]
  end
end
