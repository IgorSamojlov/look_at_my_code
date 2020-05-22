require 'rails_helper'

RSpec.describe "codes/index", type: :view do
  before(:each) do
    assign(:codes, [
      Code.create!(
        title: "Title",
        author: "Author",
        permalink: "Permalink",
        code: "MyText",
        pepper: "Pepper",
        syntax: nil
      ),
      Code.create!(
        title: "Title",
        author: "Author",
        permalink: "Permalink",
        code: "MyText",
        pepper: "Pepper",
        syntax: nil
      )
    ])
  end

  it "renders a list of codes" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Author".to_s, count: 2
    assert_select "tr>td", text: "Permalink".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Pepper".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
