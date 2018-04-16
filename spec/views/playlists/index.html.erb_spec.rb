require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  before(:each) do
    assign(:playlists, [
      Playlist.create!(
        :playlist_name => "Playlist Name",
        :creator_id => nil
      ),
      Playlist.create!(
        :playlist_name => "Playlist Name",
        :creator_id => nil
      )
    ])
  end

  it "renders a list of playlists" do
    render
    assert_select "tr>td", :text => "Playlist Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
