# encoding: utf-8
#
# This file is a part of Redmine default project page
#
# @author Strnadj <jan.strnadek@gmail.com>

require File.expand_path('../../test_helper', __FILE__)

class DefaultProjectPageTest < ActionController::TestCase
  tests ::ProjectsController
  fixtures :projects, :versions, :users, :roles, :members,
           :member_roles, :issues, :journals, :journal_details,
           :trackers, :projects_trackers, :issue_statuses,
           :enabled_modules, :enumerations, :boards, :messages,
           :attachments, :custom_fields, :custom_values, :time_entries

  def setup
    @request.session[:user_id] = 2
    Setting.default_language = 'en'
  end

  def test_settings_present
    get :settings, :id => 1
    assert_select 'select#project_default_project_page' do
      assert_select 'option', Project.get_default_project_pages
    end
  end

  def test_overview_project
    Project.find(1).update_attributes(default_project_page: 'overview')
    get :settings, :id => 1
  end
end
