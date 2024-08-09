# frozen_string_literal: true

RSpec.describe Generatepass do
  it "has a version number" do
    expect(Generatepass::VERSION).not_to be nil
  end

  it "Generate 1000 passwords" do
    passwords_array = []
    1000.times do
      password = Generatepass.gen
      expect(password).not_to be nil
      expect(passwords_array.include?(password)).to eq(false)
      passwords_array << password
    end
    expect(passwords_array.length).to eq(1000)
  end

  it "Generate 10000 passwords and check if they are unique" do
    passwords_array = []
    100_000.times do
      password = Generatepass.gen
      expect(password).not_to be nil
      expect(passwords_array.include?(password)).to eq(false)
      passwords_array << password
      puts password
    end

    expect(passwords_array.length).to eq(100_000)
  end
end
