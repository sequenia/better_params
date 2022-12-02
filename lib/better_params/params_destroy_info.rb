module BetterParams
  class ParamsDestroyInfo
    def self.add(*args)
      new.add(*args)
    end

    # For all has_many relations from a keys array adds information
    # about destroying objects by an algorythm:
    # If a nested object doesn't exists in a passed object it will be destroyed.
    def add(original_params, object, *keys)
      return original_params if object.nil?

      # Process every key and merge updated information to params
      prepare_keys(keys).reduce(original_params) do |params, (key, nested_keys)|
        # Don't needs to process key if params is not passed
        nested_params = params[key]
        next params if nested_params.nil?

        # Try to fetch relation value
        relation = object.public_send(relation_key(key))

        # Can't process key if a nested object doesn't exists
        next params if relation.nil?

        if relation.is_a? Enumerable
          # If a relation is a has_many, needs to add information about destroying
          nested_params = add_destroy_info(nested_params, relation)

          # Needs to go deeper to the every object in an array if has nested keys
          unless nested_keys.nil?
            nested_params = add_nested_destroy_info(
              nested_params, relation, nested_keys
            )
          end
        else
          # If a relation is a single object we needs to go deeper
          nested_params = add(nested_params, relation, *nested_keys)
        end

        next params.merge(key => nested_params)
      end
    end

    protected

    # Converts all keys to the same format -
    # hash with array values where value can be nil
    def prepare_keys(keys)
      keys.reduce({}) do |hash, key|
        hash.merge(key.is_a?(Hash) ? key : { key => nil })
      end
    end

    # Removes the "_attributes" suffix if exists
    def relation_key(key)
      match_data = key.to_s.match(/(.+)_attributes\z/)
      match_data.nil? ? key : match_data[1].to_sym
    end

    # Adds { id: 1, _destroy: true } objects to an array if an object with id
    # is not exists in the array but exists in a relation
    def add_destroy_info(params_array, relation)
      existed_ids = relation.map(&:id)
      passed_ids = params_array.map { |attributes| attributes[:id] }.compact
      ids_to_destroy = existed_ids - passed_ids
      params_array + ids_to_destroy.map do |id|
        ActionController::Parameters.new(id: id, _destroy: true).permit!
      end
    end

    def add_nested_destroy_info(params_array, relation, nested_keys)
      nested_objects_by_id = relation.group_by(&:id).transform_values(&:first)
      params_array.map do |attributes|
        id = attributes[:id]
        nested_object = nested_objects_by_id[id]
        next attributes if nested_object.nil?

        add(attributes, nested_object, *nested_keys)
      end
    end
  end
end
