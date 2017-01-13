Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  %w/404 422 500 outdated-browser/.each do |error_page|
    match error_page, to: "errors#error_#{error_page.underscore}", via: :all
  end
end
