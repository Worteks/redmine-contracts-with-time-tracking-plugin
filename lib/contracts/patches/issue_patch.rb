require_dependency 'issue'

module Contracts::Patches
  module IssuePatch

    def self.included(base)
      base.send(:prepend, InstanceMethods)
    end

    module InstanceMethods
      # Make Redmine believe issue is not loggable so it won't render
      # time tracking block to issue form
      def time_loggable?(user=User.current)
        false
      end

      # Copy original check method so we can access it from the action menu view
      def time_loggable_real?(user=User.current)
        user.allowed_to?(:log_time, project) && (Setting.timelog_accept_closed_issues? || !closed?)
      end
    end
  end
end

