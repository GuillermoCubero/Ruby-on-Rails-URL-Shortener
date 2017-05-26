require 'rails_helper'

RSpec.describe ShortsHelper, type: :helper do
    
    describe "link_to_url" do
        it "links to an url using its name" do
          short = Short.create(url: 'www.google.es')
          expect(helper.link_url(short.url)).to include('www.google.es')
          expect(helper.link_url(short.url)).to have_selector(:css, 'a[href="http://www.google.es"]')
        end
    end
    
end
