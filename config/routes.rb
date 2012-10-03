WashOutSample::Application.routes.draw do
  root :to => 'welcome#index'
  wash_out :prelink_stub
  match "order" => "welcome#order_request"
  match "create" => "welcome#create"
  match "view" => "welcome#view"

end