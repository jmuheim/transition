require 'spec_helper'

describe MiniHubCell do

  describe '#show' do
    context 'member available' do
      before { @member = build_stubbed(:member) }
      subject { render_cell :mini_hub, :show, member: @member }

      it 'displays "Welcome, <username>"' do
        should have_selector 'p', text: "Welcome, #{@member.username}!"
      end

      it "displays a link to edit the member's account" do
        should have_link 'Edit account', href: edit_member_registration_path
      end

      it 'displays a link to log out' do
        should have_link 'Log out', href: destroy_member_session_path
      end
    end
  end

  context 'member not available' do
    subject { render_cell :mini_hub, :show, member: nil }

    it 'displays "Welcome, <username>"' do
      should have_selector 'p', text: 'You are not signed in.'
    end

    it 'displays a link to login / register' do
      should have_link 'Login / register', href: new_member_session_path
    end
  end

end