module DefaultProjectPage
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        unloadable
        # Add time spent
        safe_attributes 'default_project_page'

        def self.get_default_project_pages
          [
            ['Overview', :overview],
            ['Activity', :activity],
            ['Schedule', :schedules],
            ['Roadmap', :roadmap],
            ['Issues', :issues],
            ['New Issue', :new_issue],
            ['Gantt', :gantt],
            ['Calendar', :calendar],
            ['Documents', :documents],
            ['Wiki', :wiki],
            ['Files', :files],
            ['Repository', :repository],
            ['Code reviews', :code_review],
            ['Settings', :settings],
          ]
        end
      end
    end
  end
end
