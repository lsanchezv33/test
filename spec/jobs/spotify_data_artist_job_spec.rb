# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpotifyDataArtistJob, type: :job do
  describe '.create' do
    subject(:job) { described_class.perform_later }

    context 'spotify data' do
      it 'queues the job' do
        expect { job }.to have_enqueued_job(described_class)
      end

      it 'should have name' do
        expect(job.queue_name).to eq('spotify_data_artist')
      end
    end
  end
end
