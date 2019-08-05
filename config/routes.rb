Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'meta_form' => 'homes#meta_form'
  post 'trash_list' => 'homes#trash_list'
  post 'trash_list_item' => 'homes#trash_list_item'
  post 'restore_list' => 'homes#restore_list'
  post 'restore_list_item' => 'homes#restore_list_item'

  post 'restore_all' => 'homes#restore_all'
  
end
