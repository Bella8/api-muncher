Rails.application.routes.draw do
  root 'recipes#search_home'
  get '/recipes/:search' => 'recipes#search', as: 'recipes_search'
  get '/recipe/*uri' => 'recipes#show', format:false, as: 'recipe'

  # /search/?q=pizza&page=1
  # page: params page -1
end
