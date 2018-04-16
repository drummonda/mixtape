require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :song_title => "Song Title",
        :song_artist => "Song Artist",
        :playlist_id => nil
      ),
      Song.create!(
        :song_title => "Song Title",
        :song_artist => "Song Artist",
        :playlist_id => nil
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Song Title".to_s, :count => 2
    assert_select "tr>td", :text => "Song Artist".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
