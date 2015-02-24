module DefaultProjectPage
  class ViewHooks < Redmine::Hook::ViewListener
    def view_projects_form(context={})
      return context[:controller].send(:render_to_string, {
        :partial => 'projects/default_project_page_input',
        :locals => {
          :project => context[:project],
          :f       => context[:form],
          :pages => Project.get_default_project_pages
        }
      })
    end
  end
end
