require 'rails_helper'

RSpec.describe "playlists/new", type: :view do
  before(:each) do
    assign(:playlist, Playlist.new(
      :playlist_name => "MyString",
      :creator_id => nil
    ))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", playlists_path, "post" do

      assert_select "input[name=?]", "playlist[playlist_name]"

      assert_select "input[name=?]", "playlist[creator_id_id]"
    end
  end
end
