require 'rails_helper'

RSpec.describe Link, type: :model do
    it "is valid with an original URL and lookup code" do
        link = Link.new(
            original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(true)
    end

    it "is invalid if the URL is not formatted properly" do
        link = Link.new(
            original_url: "asdf",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(false)
    end

    it "is invalid without a lookup code" do
        link = Link.new(
            original_url: "https://www.favoritewebsite.com/articles/how-to-cook"
        )
        expect(link.valid?).to be(false)
    end

    it "is invalid without an original URL" do
        link = Link.new(
            lookup_code: "1234567"
        )
        expect(link.valid?).to be(false)
    end

    it "is invalid with a duplicate lookup code" do
        link = Link.new(
            original_url: "https://www.favoritewebsite.com/articles/how-to-cook",
            lookup_code: "1234567"
        )
        link.save

        link_2 = Link.new(
            original_url: "https://www.favoritewebsite.com/articles/how-to-bake",
            lookup_code: "1234567"
        )
        expect(link_2.valid?).to be(false)
    end
end