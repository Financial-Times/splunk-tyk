# Tyk Splunk app

Support for [Tyk Pump](https://github.com/TykTechnologies/tyk-pump) packaged as a Splunk app.

This Splunk app is compatible with the [Splunk Common Information Model (CIM)](https://docs.splunk.com/Documentation/CIM/5.0.1/User/Overview) for [Web](https://docs.splunk.com/Documentation/CIM/5.0.1/User/Web).

## Source types

| Source type     | Description           |
|-----------------|-----------------------|
| `tyk:pump`      | Tyk API request logs. |

## Tyk Pump Configuration

```json
{
  "type": "splunk",
  "meta": {
    "collector_token": "<splunk_hec_token>",
    "collector_url": "https://http-inputs-<host>.splunkcloud.com/services/collector/event",
    "enable_batch": true,
    "obfuscate_api_keys": true,
    "obfuscate_api_keys_length": 10,
    "fields": [
        "method",
        "path",
        "raw_path",
        "user_agent",
        "response_code",
        "api_key",
        "api_name",
        "api_id",
        "request_time",
        "ip_address",
        "tags",
        "alias"
    ],
    "ignore_tag_prefix_list": [
        "key-",
        "org-",
        "api-",
        "original-path-",
    ]
  }
}
```

## Releasing

[Create a release in GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) to trigger a workflow that builds and uploads an package to the [GitHub release assets](/releases), e.g. `splunk_tyk-1.0.0.tar.gz`. [This file can be installed on Splunk.](https://docs.splunk.com/Documentation/SplunkCloud/latest/Admin/PrivateApps)

The version number in `app/default/app.conf` will automatically be updated in the default branch to match the release via a pull request.
