require 'spec_helper'
describe "JsonML#.to_html_text" do

  let(:ml) {
    [ 'html',
      { lang: 'en' },
      [
        'body',
        [
          'p',
          'Hello world'
        ]
      ]
    ]
  }

  subject{
    JsonML.to_html_text(ml)
  }

  let(:expected) {
    %Q{<html lang="en"><body><p>Hello world</p></body></html>}
  }
  
  it 'works' do
    expect(subject).to eql(expected)
  end

end