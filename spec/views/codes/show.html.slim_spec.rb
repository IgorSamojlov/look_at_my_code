require 'rails_helper'

RSpec.describe "codes/show", type: :view do
  before(:each) do
    @code = assign(:code, Code.create!(
      title: "Title",
      author: "Author",
      permalink: "Permalink",
      code: "MyText",
      pepper: "Pepper",
      syntax: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Permalink/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Pepper/)
    expect(rendered).to match(//)
  end
end
