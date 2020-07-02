# BetterParams
Adds useful methods to `ActionController::Parameters` for modifying parameters.

## Usage
`ActionController::Parameters` has useful methods for modifying parameters.

### AddDestroyInfo
Adds the *_destroy* attribute to existing *has_many* associations that were not passed for modification.
The method accepts 2 parameters: an Active Record Object and a symbolic list of association names.
Supports nested lists.
```ruby
params.add_destroy_info(object, :associations_one, :associations_two)
```

### Booleans
Converts a parameter to a Boolean value.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
params.booleans(:attribute_one, :attribute_two)
```

### Datetimes
Converts a parameter to a Time value.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
params.datetimes(:attribute_one, :attribute_two)
```

### PrepareNestedAttributes
Adds the *_attributes* Postfix to nested parameters, which allows creating a group of related entities using the `assign_attributes` method.
The method accepts 1 parameters: Symbolic list of association names.
Supports nested lists.
```ruby
params.prepare_nested_attributes(
  :associations_one,
  associations_two: [
    :associations_one_for_parent,
    :associations_two_for_parent
  ]
)
```

### RemoveBlanks
Deletes keys with empty values.
Not supports nested lists.
```ruby
params.remove_blanks
```

### ReplaceBlanksByNil
Replaces blanks by nil.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
params.replace_blanks_by_nil(:attribute_one, :attribute_two)
```

### StripValues
Removes leading and trailing spaces.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
params.strip_values(:attribute_one, :attribute_two)
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'better_params'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install better_params
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
