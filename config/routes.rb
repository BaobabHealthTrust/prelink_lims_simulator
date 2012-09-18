WashOutSample::Application.routes.draw do
  root :to => 'welcome#index'
  wash_out :prelink_stub

end