require "rails_helper"

RSpec.describe Shortener do
    it "shortens a URL to a 7-character code" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "generates unique codes for different URLs" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.favoritewebsite.com/articles/how-to-bake"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).not_to eq(code_1)
    end

    it "generates the same code for the same URL" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        first_code = shortener.lookup_code

        shortener = Shortener.new(url)
        second_code = shortener.lookup_code

        expect(first_code).to eq(second_code)
    end
end
