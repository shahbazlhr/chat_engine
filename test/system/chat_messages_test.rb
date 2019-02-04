require "application_system_test_case"

class ChatMessagesTest < ApplicationSystemTestCase
  setup do
    @chat_message = chat_messages(:one)
  end

  test "visiting the index" do
    visit chat_messages_url
    assert_selector "h1", text: "Chat Messages"
  end

  test "creating a Chat message" do
    visit chat_messages_url
    click_on "New Chat Message"

    fill_in "Chat room", with: @chat_message.chat_room_id
    fill_in "Message", with: @chat_message.message
    click_on "Create Chat message"

    assert_text "Chat message was successfully created"
    click_on "Back"
  end

  test "updating a Chat message" do
    visit chat_messages_url
    click_on "Edit", match: :first

    fill_in "Chat room", with: @chat_message.chat_room_id
    fill_in "Message", with: @chat_message.message
    click_on "Update Chat message"

    assert_text "Chat message was successfully updated"
    click_on "Back"
  end

  test "destroying a Chat message" do
    visit chat_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chat message was successfully destroyed"
  end
end
