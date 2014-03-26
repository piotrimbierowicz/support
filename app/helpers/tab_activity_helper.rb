module TabActivityHelper

  def is_questions_tab_active?
    return true if params[:controller] == 'questions'
    return true if params[:controller] == 'answers'
    return true if params[:controller] == 'projects' and params[:action] == 'questions'
    false
  end

  def is_tasks_tab_active?
    false
  end

  def is_version_confirment_tab_active?
    return true if params[:controller] == 'versions'
    return true if params[:controller] == 'manual_tests'
    false
  end

  def is_project_tab_active?
    return true if params[:controller] == 'projects' and params[:action] == 'show'
    false
  end

end