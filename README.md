# bitbar-grafana
[BitBar](https://getbitbar.com/) plugin to show [Grafana](https://grafana.com/) active [alerts](https://grafana.com/docs/alerting/rules/)

## Installation

To build the plugin, make sure the hostname is set in the environment variable GRAFANA_HOST. For example:
```bash
$ GRAFANA_HOST=my.grafana.host shards build
```

After that, copy the generated binary `bin/grafana` into the BitBar plugins directory.

This plugin looks for the Grafana API key from the macOS keychain. Make sure to add an entry using the hostname as the entry name, and `apikey` as the account name. Once the item is created, make sure to run the plugin executable at least once and give permanent access to the keychain entry.

You can customise the alert's prefix by setting `GRAFANA_ALERT_PREFIX` environment variable when building. It defaults to `Grafana: ` (whitespace included so you can omit it if you want).

## Contributing

1. Fork it (<https://github.com/waj/bitbar-grafana/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Juan Wajnerman](https://github.com/waj) - creator and maintainer
