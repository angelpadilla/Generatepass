# frozen_string_literal: true

require_relative "generatepass/version"
require "digest"
require "base64"

module Generatepass
  class Error < StandardError; end

  LOWERCASE = ("a".."z").to_a
  UPPERCASE = ("A".."Z").to_a
  SYMBOLS = "!#$%&()*+,-./:;<=>?@[]_{}".split(//)
  NUMBERS = ("0".."9").to_a
  URL_UNSAFE = "=#%/:@&?".split(//)
  AMBIGUOUS = "B8G6I1l0OQDS5Z2Ss5Bb8|Iio01lO".split(//)

  # Generates a password with the specified length and options.
  #
  # @param length [Integer] The length of the password. Defaults to 12.
  # @param include_uppercase [Boolean] Whether to include uppercase letters. Defaults to true.
  # @param include_symbols [Boolean] Whether to include symbols. Defaults to true.
  # @param include_digits [Boolean] Whether to include digits. Defaults to true.
  # @param exclude_ambiguous [Boolean] Whether to exclude ambiguous characters. Defaults to false.
  # @param url_safe [Boolean] Whether the password should be URL safe. Defaults to false.
  #
  # @return [String] The generated password.
  #
  # @raise [ArgumentError] If the password length is less than 5.
  #
  # @example
  #   Generatepass.gen
  #   # => "Qwertyuiop"
  #   Generatepass.gen(length: 20)
  #   # => "Qwertyuiopasdfghjklzxcvbnm1234567890"
  #   Generatepass.gen(include_uppercase: false)
  #   # => "xl6#_q.+,sis"
  #   Generatepass.gen(include_symbols: false)
  #   # => "BSaF10pfaJty"
  #   Generatepass.gen(include_digits: false)
  #   # => "C:&!}E&UZ&am"
  #   Generatepass.gen(exclude_ambiguous: true)
  #   # => "VWs9]Qx77&}*"
  #   Generatepass.gen(url_safe: true)
  #   # => "LYLqE,N+(&Jm"
  #
  def self.gen(length: 12, include_uppercase: true, include_symbols: true, include_digits: true, exclude_ambiguous: false, url_safe: false)
    raise ArgumentError, "Minimum password length is 5" if length < 5
    raise ArgumentError, ":length must be an integer" if length.class != Integer
    raise ArgumentError, ":length must be greater than 0" if length <= 0

    if include_uppercase.class != TrueClass && include_uppercase.class != FalseClass
      raise ArgumentError,
            ":include_uppercase must be a boolean"
    end
    if include_symbols.class != TrueClass && include_symbols.class != FalseClass
      raise ArgumentError,
            ":include_symbols must be a boolean"
    end
    if include_digits.class != TrueClass && include_digits.class != FalseClass
      raise ArgumentError,
            ":include_digits must be a boolean"
    end
    if exclude_ambiguous.class != TrueClass && exclude_ambiguous.class != FalseClass
      raise ArgumentError,
            ":exclude_ambiguous must be a boolean"
    end
    raise ArgumentError, ":url_safe must be a boolean" if url_safe.class != TrueClass && url_safe.class != FalseClass

    charset = LOWERCASE
    charset += UPPERCASE if include_uppercase
    charset += SYMBOLS if include_symbols
    charset += NUMBERS if include_digits
    charset -= URL_UNSAFE if url_safe
    charset -= AMBIGUOUS if exclude_ambiguous

    (0...length).map { charset.sample }.join
  end

  # Generates a token in hexadecimal format using SHA-256 hashing, useful for password or api tokens.
  #
  # @return [String] A hexadecimal string representing the token.
  #
  # @example
  #   Generatepass.token_hex
  #   # => "5e22d42c3e8a6509cd873f0cfdbc53b2d5f4b0c2ef695a4c8442a2e7b7ea7a79"
  def self.token_hex
    random_number1 = rand(99_999_999).to_s.rjust(8, "0")
    random_number2 = rand(99_999_999).to_s.rjust(8, "0")
    Digest::SHA256.hexdigest("#{Time.now.to_i}#{random_number1}#{random_number2}")
  end

  # Generates a token in base64 format using SHA-256 hashing, useful for password or api tokens.
  #
  # @param url_safe [Boolean] Whether the token should be URL safe. Defaults to false.
  #
  # @return [String] A base64 string representing the token.
  #
  # @example
  #   Generatepass.token_base64
  #   # => "2ok5bRvyKEYWIOSLrsa4qzXGk7dadWwUZXBinWguhSE="
  #   Generatepass.token_base64(url_safe: true)
  #   # => "GSJ6nTJ96Js9pn6CEh54VJplcFCK64BZHnc3lBO8HI"
  def self.token_base64(url_safe: false)
    raise ArgumentError, ":url_safe must be a boolean" if url_safe.class != TrueClass && url_safe.class != FalseClass

    random_number1 = rand(99_999_999).to_s.rjust(8, "0")
    random_number2 = rand(99_999_999).to_s.rjust(8, "0")
    digest = Digest::SHA256.base64digest("#{Time.now.to_i}#{random_number1}#{random_number2}")

    if url_safe
      set = digest.split(//) - URL_UNSAFE
      set.join
    else
      digest
    end
  end

  # Generates a token in base64 (version 'b') format using Base64 encoding, useful for password or api tokens.
  #
  # @param url_safe [Boolean] Whether the token should be URL safe. Defaults to false.
  #
  # @return [String] A base64 string representing the token.
  #
  # @example
  #   Generatepass.token_base64b
  #   # => "MTcyNTQxMzQ2OTgxNTc0NjIwMTY1ODYzMDk=\n"
  #   Generatepass.token_base64b(url_safe: true)
  #   # => "MTcyNTQxMzQ1ODUzNjAyMDg3NjY0NTYwMzk"
  def self.token_base64b(url_safe: false)
    raise ArgumentError, ":url_safe must be a boolean" if url_safe.class != TrueClass && url_safe.class != FalseClass

    random_number1 = rand(99_999_999).to_s.rjust(8, "0")
    random_number2 = rand(99_999_999).to_s.rjust(8, "0")
    if url_safe
      Base64.urlsafe_encode64("#{Time.now.to_i}#{random_number1}#{random_number2}", padding: false)
    else
      Base64.encode64("#{Time.now.to_i}#{random_number1}#{random_number2}")
    end
  end
end
