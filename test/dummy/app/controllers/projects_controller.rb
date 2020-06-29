class ProjectsController < ApplicationController
  def params_add_destroy_info
    render json: project_params.add_destroy_info(nil, :tags).to_json
  end

  def params_booleans
    render json: project_params.booleans(:is_active).to_json
  end

  def params_datetimes
    render json: project_params.datetimes(:start_date).to_json
  end

  def params_prepare_nested_attributes
    render json: project_params.prepare_nested_attributes(:tags).to_json
  end

  def params_remove_blanks
    render json: project_params.remove_blanks.to_json
  end

  def params_replace_blanks_by_nil
    render json: project_params.replace_blanks_by_nil(:name).to_json
  end

  def params_strip_values
    render json: project_params.strip_values(:name).to_json
  end

  protected

  def project_params
    params.permit(
      :name,
      :is_active,
      :start_datetime,
      tags: [:id, :name]
    )
  end
end
