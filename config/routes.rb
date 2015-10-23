Rails.application.routes.draw do
  root to: 'galleries#new'

  get    '/!:slug' => 'galleries#show',    as: :gallery
  put    '/!:slug' => 'galleries#update'
  delete '/!:slug' => 'galleries#destroy'

  get    '/!:slug/timeline' => 'galleries#timeline', as: :gallery_timeline

  get    '/-:token' => 'boss_tokens#show',    as: :gallery_delete
  delete '/-:token' => 'boss_tokens#destroy'

  delete '/-:token/:id' => 'boss_tokens#destroy_picture', as: :gallery_picture_delete

  # get    '/!:slug/:id' => 'galleries#show',  as: :gallery_picture
  patch  '/!:slug/:id' => 'pictures#update', as: :gallery_picture
  post   '/!:slug'     => 'pictures#create'
  put    '/!:slug/:id' => 'pictures#update'

  get    '/!:slug/tags/:tags' => 'galleries#show', as: :gallery_tags

  get    '/!:slug/:id/rating' => 'ratings#show',  as: :picture_rating
  post   '/!:slug/:id/rating' => 'ratings#create'

  get    '/!:slug/:id/download' => 'pictures#download', as: :gallery_picture_download

  get    '/+:fingerprint' => 'pictures#show', as: :picture

  post   '/content_security_policy/forward_report' => 'content_security_policy#scribe'

  resources :galleries, only: [:create, :index]
end
