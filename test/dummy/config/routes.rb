Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'add_destroy_info' => 'projects#params_add_destroy_info'
  post 'booleans' => 'projects#params_booleans'
  post 'datetimes' => 'projects#params_datetimes'
  post 'prepare_nested_attributes' =>
  'projects#params_prepare_nested_attributes'
  post 'remove_blanks' => 'projects#params_remove_blanks'
  post 'replace_blanks_by_nil' => 'projects#params_replace_blanks_by_nil'
  post 'strip_values' => 'projects#params_strip_values'
end
