require 'rails_helper'

RSpec.describe "playlists/edit", type: :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :playlist_name => "MyString",
      :creator_id => nil
    ))
  end

  it "renders the edit playlist form" do
    render

    assert_select "form[action=?][method=?]", playlist_path(@playlist), "post" do

      assert_select "input[name=?]", "playlist[playlist_name]"

      assert_select "input[name=?]", "playlist[creator_id_id]"
    end
  end
end
