require "application_system_test_case"

class ChatRoomsTest < ApplicationSystemTestCase
  setup do
    @chat_room = chat_rooms(:one)
  end

  test "visiting the index" do
    visit chat_rooms_url
    assert_selector "h1", text: "Chat Rooms"
  end

  test "creating a Chat room" do
    visit chat_rooms_url
    click_on "New Chat Room"

    fill_in "Recieverable", with: @chat_room.recieverable_id
    fill_in "Recieverable type", with: @chat_room.recieverable_type
    fill_in "Senderable", with: @chat_room.senderable_id
    fill_in "Senderable type", with: @chat_room.senderable_type
    click_on "Create Chat room"

    assert_text "Chat room was successfully created"
    click_on "Back"
  end

  test "updating a Chat room" do
    visit chat_rooms_url
    click_on "Edit", match: :first

    fill_in "Recieverable", with: @chat_room.recieverable_id
    fill_in "Recieverable type", with: @chat_room.recieverable_type
    fill_in "Senderable", with: @chat_room.senderable_id
    fill_in "Senderable type", with: @chat_room.senderable_type
    click_on "Update Chat room"

    assert_text "Chat room was successfully updated"
    click_on "Back"
  end

  test "destroying a Chat room" do
    visit chat_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chat room was successfully destroyed"
  end
end
