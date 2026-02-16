require_relative 'lib/contracts/hooks'
require_relative 'lib/contracts/patches/time_entry_patch'
require_relative 'lib/contracts/patches/timelog_controller_patch'
require_relative 'lib/contracts/patches/user_patch'
require_relative 'lib/contracts/patches/project_patch'


Redmine::Plugin.register :contracts do
  name 'Redmine Contracts With Time Tracking'
  author 'Ben Syzek, Shanti Braford, Wesley Jones'
  description 'A Redmine plugin that allows you to manage contracts and associate time-entries with those contracts.'
  version '2.4'
  url 'https://github.com/upgradeya/redmine-contracts-with-time-tracking-plugin.git'

  requires_redmine :version_or_higher => '3.0'
 
  menu :application_menu, :contracts, { :controller => :contracts, :action => :all }, :caption => :label_contracts, :if => Proc.new { User.current.logged? && User.current.allowed_to?(:view_all_contracts_for_project, nil, :global => true) } 
  menu :project_menu, :contracts, { :controller => :contracts, :action => :index }, :caption => :label_contracts, :param => :project_id

  settings :default => {'empty' => true}, :partial => 'settings/contract_settings'

  project_module :contracts do
    permission :view_all_contracts_for_project,       :contracts => [:index, :series]
    permission :view_contract_details,                :contracts => :show
    permission :edit_contracts,                       :contracts => [:edit, :update, :add_time_entries, :assoc_time_entries_with_contract, :lock]
    permission :create_contracts,                     :contracts => [:new, :create]
    permission :delete_contracts,                     :contracts => :destroy
    permission :view_hourly_rate,                     :contracts => :view_hourly_rate #view_hourly_rate is a fake action!
    permission :create_expenses,                      :contracts_expenses => [:new, :create]
    permission :edit_expenses,                        :contracts_expenses => [:edit, :update]
    permission :delete_expenses,                      :contracts_expenses => :destroy
    permission :view_expenses,                        :contracts_expenses => :show
  end
end

# Load your patches from contracts/lib/contracts/patches/
Rails.application.config.after_initialize do
  Project.send(:include, Contracts::Patches::ProjectPatch)
  TimeEntry.send(:include, Contracts::Patches::TimeEntryPatch)
  TimelogController.send(:include, Contracts::Patches::TimelogControllerPatch)
  User.send(:include, Contracts::Patches::UserPatch)
  Issue.send(:include, Contracts::Patches::IssuePatch)
  require_relative 'app/models/contract_category'
end
