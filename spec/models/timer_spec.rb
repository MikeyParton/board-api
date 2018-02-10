require 'rails_helper'

RSpec.describe Timer, type: :model do
  let(:timer) { create(:timer) }

  describe 'base state transitions' do
    it 'changes state on start/stop' do
      expect(timer).to have_state(:fresh)
      expect(timer).to transition_from(:fresh).to(:started).on_event(:start)
      expect(timer).to transition_from(:started).to(:stopped).on_event(:stop)
      expect(timer).to transition_from(:stopped).to(:started).on_event(:start)
    end
  end


  describe '#start' do
    it 'sets started_at' do
      Timecop.freeze do
        timer.start
        expect(timer.started_at).to eq(Time.now)
        expect(timer.status).to eq('started')
      end
    end
  end

  describe '#stop' do
    it 'sets stopped_at and updates seconds' do
      Timecop.freeze do
        timer.start
        Timecop.travel(Time.now + 1.minute)
        timer.stop

        expect(timer.seconds).to eq(60)
      end
    end
  end

  describe 'starting and stopping with inactivity inbetween' do
    it 'sets stopped_at and updates only seconds spent while started' do
      Timecop.freeze do
        timer.start
        Timecop.travel(Time.now + 1.minute)
        timer.stop
        Timecop.travel(Time.now + 3.minutes)
        timer.start
        Timecop.travel(Time.now + 1.minute)
        timer.stop

        expect(timer.seconds).to eq(120)
      end
    end
  end
end
