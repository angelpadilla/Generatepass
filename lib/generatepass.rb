# frozen_string_literal: true

require_relative "generatepass/version"
require "digest"

module Generatepass
  class Error < StandardError; end

  LOWERCASE = ("a".."z").to_a
  UPPERCASE = ("A".."Z").to_a
  SYMBOLS = "!#$%&()*+,-./:;<=>?@[]_{}".split(//)
  NUMBERS = ("0".."9").to_a
  URL_UNSAFE = "#%/:@&?".split(//)
  AMBIGUOUS = "B8G6I1l0OQDS5Z2Ss5Bb8|Iio01lO".split(//)

  def self.gen(length: 12, include_uppercase: true, include_symbols: true, include_digits: true, exclude_ambiguous: false, url_safe: false)
    # puts Digest::SHA256.hexdigest("#{Time.now}#{rand}")
    # puts Digest::SHA256.hexdigest("#{Time.now}#{rand}").to_i(16).to_s(36)
    raise "Minimum length is 5" if length < 5

    charset = LOWERCASE
    charset += UPPERCASE if include_uppercase
    charset += SYMBOLS if include_symbols
    charset += NUMBERS if include_digits
    charset -= URL_UNSAFE if url_safe
    charset -= AMBIGUOUS if exclude_ambiguous

    (0...length).map { charset.sample }.join
  end
end
