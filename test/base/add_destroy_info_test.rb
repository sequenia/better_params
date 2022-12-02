require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  # TODO: improve
  test '#add_destroy_info' do
    # Init project and tags
    project = Project.new
    tag1 = Tag.new(name: 'Tag1')
    tag2 = Tag.new(name: 'Tag2')
    project.tags << tag1
    project.tags << tag2
    project.save

    hash_params = {
      tags: [
        { id: tag2.id, name: 'New Tag2' },
        { name: 'Tag3' }
      ]
    }

    params = init_params(hash_params)
    new_params = params.add_destroy_info(project, :tags)
    params_tg = new_params[:tags].select { |prm_tg| prm_tg[:_destroy] }

    assert params_tg.count == 1 && params_tg.first[:id] == tag1.id
  end

  test '#add_destroy_info for _attributes key' do
    # Init project and tags
    project = Project.new
    tag1 = Tag.new(name: 'Tag1')
    tag2 = Tag.new(name: 'Tag2')
    project.tags << tag1
    project.tags << tag2
    project.save

    hash_params = {
      tags_attributes: [
        { id: tag2.id, name: 'New Tag2' },
        { name: 'Tag3' }
      ]
    }

    params = init_params(hash_params)
    new_params = params.add_destroy_info(project, :tags_attributes)
    params_tg = new_params[:tags_attributes].select { |prm_tg| prm_tg[:_destroy] }

    assert params_tg.count == 1 && params_tg.first[:id] == tag1.id
  end

  # TODO: improve
  test '#add_destroy_info when params empty' do
    # Init project and tags
    project = Project.new
    tag = Tag.new(name: 'Tag')
    project.tags << tag
    project.save

    hash_params = { tags: [] }
    params = init_params(hash_params)
    new_params = params.add_destroy_info(project, :tags)
    params_tg = new_params[:tags].select { |prm_tg| prm_tg[:id] == tag.id }
    assert params_tg.first[:_destroy]
  end

  test '#add_destroy_info for nil object' do
    hash_params = {}
    params = init_params(hash_params)
    new_params = params.add_destroy_info(nil, :tags)

    assert params.eql?(new_params)
  end
end
