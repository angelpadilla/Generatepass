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

  it "Generate 20_000 passwords and check if they are unique" do
    passwords_array = []
    20_000.times do
      password = Generatepass.gen
      expect(password).not_to be nil
      expect(passwords_array.include?(password)).to eq(false)
      passwords_array << password
      puts password
    end

    expect(passwords_array.length).to eq(20_000)
  end

  it "Generate 20_000 tokens hex and check if they are unique" do
    tokens_array = []
    20_000.times do
      token = Generatepass.token_hex
      expect(token).not_to be nil
      expect(tokens_array.include?(token)).to eq(false)
      tokens_array << token
      puts token
    end

    expect(tokens_array.length).to eq(20_000)
  end

  it "Generate 20_000 tokens base64 and check if they are unique" do
    tokens_array = []
    20_000.times do
      token = Generatepass.token_base64
      expect(token).not_to be nil
      expect(tokens_array.include?(token)).to eq(false)
      tokens_array << token
      puts token
    end

    expect(tokens_array.length).to eq(20_000)
  end

  it "Generate 20_000 tokens base64b and check if they are unique" do
    tokens_array = []
    20_000.times do
      token = Generatepass.token_base64b
      expect(token).not_to be nil
      expect(tokens_array.include?(token)).to eq(false)
      tokens_array << token
      puts token
    end

    expect(tokens_array.length).to eq(20_000)
  end
end
