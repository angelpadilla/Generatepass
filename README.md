# Generatepass

Just another gem to generate random passwords and tokens, maybe useful for somebody :)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add generatepass

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install generatepass

## Usage

### Generate a random password

Optional params:

- length [Integer] The length of the password. Defaults to 12.
- include_uppercase [Boolean] Whether to include uppercase letters. Defaults to true.
- include_symbols [Boolean] Whether to include symbols. Defaults to true.
- include_digits [Boolean] Whether to include digits. Defaults to true.
- exclude_ambiguous [Boolean] Whether to exclude ambiguous characters. Defaults to false.
- url_safe [Boolean] Whether the password should be URL safe. Defaults to false.


```
require 'generatepass'

Generatepass.gen
=> "Qwertyuiop"

Generatepass.gen(length: 20)
=> "Qwertyuiopasdfghjklzxcvbnm1234567890"

Generatepass.gen(include_uppercase: false)
=> "xl6#_q.+,sis"

Generatepass.gen(include_symbols: false)
=> "BSaF10pfaJty"

Generatepass.gen(include_digits: false)
=> "C:&!}E&UZ&am"

Generatepass.gen(exclude_ambiguous: true)
=> "VWs9]Qx77&}*"

Generatepass.gen(url_safe: true)
=> "LYLqE,N+(&Jm"
```

### Generate a random hexadecimal token

``` 
require 'generatepass'

Generatepass.token_hex
=> "5e22d42c3e8a6509cd873f0cfdbc53b2d5f4b0c2ef695a4c8442a2e7b7ea7a79"
```

### Generate a random a random Base64 Token

Optional params:
- url_safe [Boolean] Whether the token should be URL safe. Defaults to false.

```
require 'generatepass'

Generatepass.token_base64
=> "2ok5bRvyKEYWIOSLrsa4qzXGk7dadWwUZXBinWguhSE="  

Generatepass.token_base64(url_safe: true)
=> "GSJ6nTJ96Js9pn6CEh54VJplcFCK64BZHnc3lBO8HI"
```

### Generate a random a random Base64 Token (version 2)

Optional params:
- url_safe [Boolean] Whether the token should be URL safe. Defaults to false.

```
require 'generatepass'

Generatepass.token_base64b
=> "MTcyNTQxMzQ2OTgxNTc0NjIwMTY1ODYzMDk=\n"

Generatepass.token_base64b(url_safe: true)
=> "MTcyNTQxMzQ1ODUzNjAyMDg3NjY0NTYwMzk"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/angelpadilla/Generatepass. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/angelpadilla/Generatepass/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Generatepass project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/angelpadilla/Generatepass/blob/master/CODE_OF_CONDUCT.md).
