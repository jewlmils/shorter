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

    it "generated a Link record with a unique lookup code" do
        url = "https://www.favoritewebsite.com/articles/how-to-cook"
        shortener = Shortener.new(url)
        link = shortener.generate_short_link
        expect(link.valid?).to be(true)

        link2 = shortener.generate_short_link
        expect(link2.valid?).to be(true)
    end
end
