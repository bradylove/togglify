TogglifyTestApp::Application.routes.draw do
  resource :welcome, controller: "welcome" do
    post 'enable'
    post 'disable'
  end

  root to: "welcome#index"
end
