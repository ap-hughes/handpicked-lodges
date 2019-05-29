require 'rails_helper'

RSpec.describe Admin::PropertiesController, type: :controller do
  let(:admin) { create :admin }

  describe 'PATCH #update - image attachment' do
    before { sign_in admin }
    before { property }

    let(:params) do
      { property: { attachments: [fixture_file_upload('amigo.png')] } }
    end

    let(:request) { put cms_project_management_ticket_path(id: ticket.id), params: params }

    it 'uploads the attachment' do
      expect { request }.to change { ActiveStorage::Attachment.count }.by(1)
    end
  end
end
