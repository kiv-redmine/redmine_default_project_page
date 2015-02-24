module DefaultProjectPage
  module ProjectsControllerPatch
    def self.included(base)
      base.class_eval do
        unloadable

        def default_page
          if params[:jump].blank? && project_page = @project.default_project_page
            redirect_to :action => :overview, :jump => project_page
          else
            redirect_to :action => :overview
          end
        end

        alias_method :overview, :show
        alias_method :show, :default_page
      end
    end
  end
end
