# BetterParams
Adds useful methods to `ActionController::Parameters` for modifying parameters.

## Usage
`ActionController::Parameters` has useful methods for modifying parameters.

### AddDestroyInfo
Adds the *_destroy* attribute to existing *has_many* associations that were not passed for modification.
The method accepts 2 parameters: an Active Record Object and a symbolic list of association names.
Supports nested lists.
```ruby
object.association_a.ids
# result
[1,2]

object.association_b.ids
# result
[1,2]

ActionController::Parameters.new(
                              a: 'a',
                              association_a: [
                                { id: 1, name: 'X1' },
                                { name: 'Y1' }
                              ],
                              association_b: [
                                { id: 1, name: 'X2' },
                                { name: 'Y2' }
                              ]
                            ).add_destroy_info(object, :association_a)
# result
{
  a: 'a',
  association_a: [
    { id: 1, name: 'X1' },
    { id: 2, _destroy: true },
    { name: 'Y1' },
  ],
  association_b: [
    { id: 1, name: 'X2' },
    { name: 'Y2' },
  ]
}
```

### Booleans
Converts a parameter to a Boolean value.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
ActionController::Parameters.new(a: 'true', b: 'false', c: 'not_bool', d: 'true')
                            .booleans(:a, :b, :c)
# result
{ a: true, b: false, c: false, d: 'true' }
```

### Datetimes
Converts a parameter to a Time value.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
ActionController::Parameters.new(a: '2020-01-01', b: '2020-01-01')
                            .datetimes(:a)
# result
{ a: 2020-01-01 00:00:00 +0700, b: '2020-01-01' }
```

### PrepareNestedAttributes
Adds the *_attributes* Postfix to nested parameters, which allows creating a group of related entities using the `assign_attributes` method.
The method accepts 1 parameters: Symbolic list of association names.
Supports nested lists.
```ruby
ActionController::Parameters.new(
                                  a: 'a',
                                  association_a: [{ a: 'a' }],
                                  association_b: [
                                    {
                                      b: 'b',
                                      association_b_a: [{ ba: 'b_a' }]
                                    }
                                  ]
                            ).prepare_nested_attributes(
                              :association_a,
                              association_b: [:association_b_a]
                            )
# result
{
  a: 'a',
  association_a_attributes: [{ a: 'a' }],
  association_b_attributes: [
    {
      b: 'b',
      association_b_a_attributes: [{ ba: 'ba' }]
    }
  ]
}
```

### RemoveBlanks
Deletes keys with empty values.
Not supports nested lists.
```ruby
ActionController::Parameters.new(a: 'a', b: '')
                            .remove_blanks
# result
{ a: 'a' }
```

### ReplaceBlanksByNil
Replaces blanks by nil.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
ActionController::Parameters.new(a: '', b: '')
                            .replace_blanks_by_nil(:a)
# result
{ a: nil, b: '' }
```

### StripValues
Removes leading and trailing spaces.
The method accepts 1 parameters: Symbolic list of attribute names.
Supports nested lists.
```ruby
ActionController::Parameters.new(a: ' a ', b: ' b ')
                            .strip_values(:a)
# result
{ a: 'a', b: ' b ' }
```

Note: For all parameters, you must make a permit

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
