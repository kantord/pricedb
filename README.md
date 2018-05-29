# pricedb
Automatically updated pricedb for ledger

This repository contains an automatically updated pricedb for *ledger*.

The pricedb contains exchange rates for all of the currencies published by the European Central Bank on this page:
https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.en.html

Because pricedbs can get pretty large, this repo includes compressed versions (.tar.gz and .tar.xz) as well as versions that
only go from 2010 and 2015 respectively.

The fastest way to download the latest version of the pricedb is probably using the .tar.xz version and extracting that,
as that is greatly reduced in size and will load almost instantly:

```
tar -xJf <(curl https://raw.githubusercontent.com/kantord/pricedb/master/price.db.tar.xz)
```

Using the compression and a reasonably fast connection it is actually feasible to just "link" the pricedb instead of
keeping a local file that you have to update. Like so:

```
ledger -f book.txt --price-db <(tar -xJf - <(curl -s https://raw.githubusercontent.com/kantord/pricedb/master/price.2015.db.tar.xz)) bal -X CNY
```

If you are looking for a reporting tool for ledger that can handle updating your pricedb for you, I recommend checking out my other project called [ledger-cli-dashboard](https://github.com/kantord/ledger-cli-dashboard).

## Supported currencies
- EUR
- AUD
- BGN
- BRL
- CAD
- CHF
- CNY
- CZK
- DKK
- EEK
- GBP
- HKD
- HRK
- HUF
- IDR
- ILS
- INR
- ISK
- JPY
- KRW
- LTL
- LVL
- MXN
- MYR
- NOK
- NZD
- PHP
- PLN
- RON
- RUB
- SEK
- SGD
- THB
- TRY
- USD
- ZAR
