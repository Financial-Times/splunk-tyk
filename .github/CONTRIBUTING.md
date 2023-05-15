# Contributing

Thanks for looking to make a contribution!

Working on a Splunk app might be a bit different to what you'd usually expect, we don't have a unit test suite for example.

To verify your changes, we suggest using one of the following methods to support a pull request:

1. Use [regex101](https://regex101.com/)
2. Configure a local Splunk environment

Screenshots and regex101 links will be appreciated in any pull request description.

## Use regex101

Smaller contributions that add or modify a field extraction, using a tool such as [regex101](https://regex101.com/) should provide enough feedback to raise the change with confidence.

Add the field extraction regex and some example logs, using named capture groups (e.g. `(?<field_name>.+)`) to confirm the extraction will work as expected.

Check out https://regex101.com/r/4fjIZl/1 as an example, which was used to verify the addition of the `state` field in [#34](https://github.com/Financial-Times/splunk-heroku/pull/34).

## Configure a local Splunk environment

For larger changes set yourself up with a local developer environment.

While Splunk provide Docker images, they don't yet work with Apple Silicone based machines.

### Installing Splunk

Download and install Splunk locally.

1. [Register for a Splunk.com account](https://www.splunk.com/page/sign_up)
2. [Download and install Splunk Enterprise](https://www.splunk.com/en_us/download/splunk-enterprise.html?locale=en_us)

### Building and installing the Splunk app

1. Build the Splunk app using `make splunk_tyk-latest.tar.gz`
2. Install or upgrade the Splunk app locally by visiting http://localhost:8000/en-GB/manager/appinstall/_upload

You can also use the Splunk CLI to install or update the app:

```
/Applications/Splunk/bin/splunk install app splunk_tyk-latest.tar.gz -update 1
```

### Sending logs to the HEC

You can recreate Tyk Pump sending logs to the Splunk HEC using the following curl command.

Ensure your Splunk HEC token has the default source type set to `tyk:pump`.

```shell
curl --user "x:$SPLUNK_HEC_TOKEN" --header 'Content-Type: application/json' 'http://localhost:8088/services/collector/event' --data '@logs.txt' --verbose
```

Create a file called `logs.txt` containing your example Tyk Pump logs.

```
{"time":"1684156274","event":{"alias":"website","api_id":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","api_key":"****AAAAAAAAAA","api_name":"User Products","host":"","ip_address":"10.0.0.1","latency":{"total":0,"upstream":0},"method":"GET","path":"/users/{uuid}/products","raw_path":"/users/123e4567-e89b-12d3-a456-426614174000/products","request_time":2,"response_code":200,"tags":["#users","#products"],"user_agent":"node-fetch/1.0 (+https://github.com/bitinn/node-fetch)"}}
{"time":"1684156274","event":{"alias":"website","api_id":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","api_key":"****AAAAAAAAAA","api_name":"User Products","host":"","ip_address":"10.0.0.1","latency":{"total":0,"upstream":0},"method":"GET","path":"/users/{uuid}/products","raw_path":"/users/123e4567-e89b-12d3-a456-426614174000/products","request_time":2,"response_code":200,"tags":["#users","#products"],"user_agent":"node-fetch/1.0 (+https://github.com/bitinn/node-fetch)"}}
{"time":"1684156274","event":{"alias":"website","api_id":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","api_key":"****AAAAAAAAAA","api_name":"User Products","host":"","ip_address":"10.0.0.1","latency":{"total":0,"upstream":0},"method":"GET","path":"/users/{uuid}/products","raw_path":"/users/123e4567-e89b-12d3-a456-426614174000/products","request_time":2,"response_code":200,"tags":["#users","#products"],"user_agent":"node-fetch/1.0 (+https://github.com/bitinn/node-fetch)"}}
{"time":"1684156274","event":{"alias":"website","api_id":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","api_key":"****AAAAAAAAAA","api_name":"User Products","host":"","ip_address":"10.0.0.1","latency":{"total":0,"upstream":0},"method":"GET","path":"/users/{uuid}/products","raw_path":"/users/123e4567-e89b-12d3-a456-426614174000/products","request_time":2,"response_code":200,"tags":["#users","#products"],"user_agent":"node-fetch/1.0 (+https://github.com/bitinn/node-fetch)"}}
{"time":"1684156274","event":{"alias":"website","api_id":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","api_key":"****AAAAAAAAAA","api_name":"User Products","host":"","ip_address":"10.0.0.1","latency":{"total":0,"upstream":0},"method":"GET","path":"/users/{uuid}/products","raw_path":"/users/123e4567-e89b-12d3-a456-426614174000/products","request_time":2,"response_code":200,"tags":["#users","#products"],"user_agent":"node-fetch/1.0 (+https://github.com/bitinn/node-fetch)"}}
```
