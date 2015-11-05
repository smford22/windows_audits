#
# Cookbook Name:: windows_audit
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#
control_group 'Windows System Settings' do
  control 'Windows Advanced Firewall Settings' do
      let(:fwstatus) { command('netsh advfirewall show domain state') }
      # Test whether firewall for domain is disabled
      it 'Windows Firewall should NOT be enabled for domain networks' do
        expect(fwstatus.stdout).to match(/State\s+OFF/)
      end
    end

    control 'Windows TimeZone' do
      let(:timezone) { command('get-date -format r') }
      # Test whether timezone is set to UTC
      it 'Timezone should be set to UTC time' do
        expect(timezone.stdout).to match(/UTC/)
      end
    end
end
