require 'redmine'

# Register plugin
Redmine::Plugin.register :redmine_default_project_page do
  name 'Optional default project page'
  author 'Jan Strnadek <jan.strnadek@gmail.com>'
  description 'Allow setting default page for every project'
  version '0.1'

  requires_redmine :version_or_higher => '2.5'
end

# Create callback to patch
ActionDispatch::Callbacks.to_prepare do
  require_dependency 'projects_controller'
  require_dependency 'application_helper'
  require_dependency 'default_project_page/view_hooks'

  unless Project.included_modules.include?(DefaultProjectPage::ProjectPatch)
    Project.send(:include, DefaultProjectPage::ProjectPatch)
  end

  unless ProjectsController.included_modules.include? DefaultProjectPage::ProjectsControllerPatch
    ProjectsController.send(:include, DefaultProjectPage::ProjectsControllerPatch)
  end

  unless ApplicationHelper.included_modules.include? DefaultProjectPage::ApplicationHelperPatch
    ApplicationHelper.send(:include, DefaultProjectPage::ApplicationHelperPatch)
  end
end

# Divert project overview menu to different action
Redmine::MenuManager.map(:project_menu).find(:overview).url[:action] = "overview"

# Add user rights to new created action
Redmine::AccessControl.permission(:view_project).actions << "projects/overview"
