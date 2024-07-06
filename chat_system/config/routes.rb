Rails.application.routes.draw do
  resources :applications, only: [:create] do
    resources :chats, only: [:create, :show] do
      resources :messages, only: [:create, :index]
    end
  end

  get 'chats/:chat_id/messages/search', to: 'messages#search'
end
