# frozen_string_literal: true

RSpec.describe 'Generatepass' do

  it "has a version number" do
    expect(Generatepass::VERSION).not_to be nil
  end

  context "Generatepass.token_hex" do

    it "Generate a token" do
      token = Generatepass.token_hex
      expect(token).not_to be nil
    end

    it "Generate 20_000 unique tokens" do
      tokens_array = []
      20_000.times do
        token = Generatepass.token_hex
        expect(token).not_to be nil
        expect(tokens_array.include?(token)).to eq(false)
        tokens_array << token
      end
      expect(tokens_array.length).to eq(20_000)
    end

  end


  context "Generatepass.token_base64" do

    it "Generate a token" do
      token = Generatepass.token_base64
      expect(token).not_to be nil
    end

    it "Generate a url safe token" do
      token = Generatepass.token_base64(url_safe: true)
      expect(token).not_to be nil
    end

    it "Raise error on invalid url_safe class" do
      expect { Generatepass.token_base64(url_safe: "invalid") }.to raise_error(ArgumentError)
    end

    it "Generate 20_000 unique base64 tokens" do
      tokens_array = []
      20_000.times do
        token = Generatepass.token_base64
        expect(token).not_to be nil
        expect(tokens_array.include?(token)).to eq(false)
        tokens_array << token
      end

      expect(tokens_array.length).to eq(20_000)
    end
  end


  context "Generatepass.token_base64b" do
    it "Generate a token" do
      token = Generatepass.token_base64b
      expect(token).not_to be nil
    end

    it "Generate a url safe token" do
      token = Generatepass.token_base64b(url_safe: true)
      expect(token).not_to be nil
    end

    it "Raise error on invalid url_safe class" do
      expect { Generatepass.token_base64b(url_safe: "invalid") }.to raise_error(ArgumentError)
    end

    it "Generate 20_000 unique base64b tokens" do
      tokens_array = []
      20_000.times do
        token = Generatepass.token_base64b
        expect(token).not_to be nil
        expect(tokens_array.include?(token)).to eq(false)
        tokens_array << token
      end

      expect(tokens_array.length).to eq(20_000)
    end
  end

  context "Generatepass.gen" do
    it "Generate a password" do
      password = Generatepass.gen
      expect(password).not_to be nil
    end
  
    it "Raise error on invalid length" do
      expect { Generatepass.gen(length: 0) }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid length class" do
      expect { Generatepass.gen(length: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid include_uppercase class" do
      expect { Generatepass.gen(include_uppercase: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid include_symbols class" do
      expect { Generatepass.gen(include_symbols: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid include_digits class" do
      expect { Generatepass.gen(include_digits: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid exclude_ambiguous class" do
      expect { Generatepass.gen(exclude_ambiguous: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Raise error on invalid url_safe class" do
      expect { Generatepass.gen(url_safe: "invalid") }.to raise_error(ArgumentError)
    end
  
    it "Generate 1000 unique passwords" do
      passwords_array = []
      1000.times do
        password = Generatepass.gen
        expect(passwords_array.include?(password)).to eq(false)
        passwords_array << password
      end
      expect(passwords_array.length).to eq(1000)
    end
  
    it "Generate 20_000 unique passwords" do
      passwords_array = []
      20_000.times do
        password = Generatepass.gen
        expect(password).not_to be nil
        expect(passwords_array.include?(password)).to eq(false)
        passwords_array << password
      end
  
      expect(passwords_array.length).to eq(20_000)
    end
  end

end