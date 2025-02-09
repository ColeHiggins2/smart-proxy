module ::Proxy::DHCP::NativeMS
  class Plugin < ::Proxy::Provider
    plugin :dhcp_native_ms, ::Proxy::VERSION

    default_settings :disable_ddns => true, :blacklist_duration_minutes => 30 * 60
    validate :disable_ddns, boolean: true

    requires :dhcp, ::Proxy::VERSION

    load_classes ::Proxy::DHCP::NativeMS::PluginConfiguration
    load_dependency_injection_wirings ::Proxy::DHCP::NativeMS::PluginConfiguration

    start_services :free_ips
  end
end
