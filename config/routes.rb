# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
#

Rails.application.routes.draw do
  get 'contracts/all',                                                       to: 'contracts#all'
  delete 'contracts/:id',                                                    to: 'contracts#destroy'
  get 'contracts/:id/edit',                                                  to: 'contracts#edit'
  get 'contracts/tooltips/:id',                                              to: 'contracts#tooltips'
  get 'projects/:project_id/contracts',                                      to: 'contracts#index'
  get 'projects/:project_id/contracts/new',                                  to: 'contracts#new'
  get 'projects/:project_id/contracts/:id/edit',                             to: 'contracts#edit'
  get 'projects/:project_id/contracts/:id',                                  to: 'contracts#show'
  post 'projects/:project_id/contracts',                                     to: 'contracts#create'
  put 'projects/:project_id/contracts/:id',                                  to: 'contracts#update'
  delete 'projects/:project_id/contracts/:id',                               to: 'contracts#destroy'
  put 'projects/:project_id/contracts/:id/lock',          	                 to: 'contracts#lock'
  get 'projects/:project_id/contracts/:id/add_time_entries',                 to: 'contracts#add_time_entries'
  put 'projects/:project_id/contracts/:id/assoc_time_entries_with_contract', to: 'contracts#assoc_time_entries_with_contract'
  put 'projects/:project_id/contracts/:id/cancel_recurring',                 to: 'contracts#cancel_recurring'
  get 'projects/:project_id/contracts/:id/series',                           to: 'contracts#series'

  # Expenses
  get 'projects/:project_id/expenses/new',                                   to: 'contracts_expenses#new'
  get 'projects/:project_id/expenses/:id/edit',                              to: 'contracts_expenses#edit'
  post 'projects/:project_id/expenses/create',                               to: 'contracts_expenses#create'
  put 'projects/:project_id/expenses/update/:id',                            to: 'contracts_expenses#update'
  delete 'projects/:project_id/expenses/destroy/:id',                        to: 'contracts_expenses#destroy'
end
