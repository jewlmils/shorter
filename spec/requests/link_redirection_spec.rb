require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

  it "redirects to the original URL when accessing a short link" do
    url = "https://www.google.com/"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    get link.shortened_url
    expect(response).to redirect_to(link.original_url)
  end

end