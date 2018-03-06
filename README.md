# check_response_http_code

## Discription

This script checks a reply HTTP cord of the target URL.
Target URL list must be written separated by newline.

If response HTTP Code is Redirect, Then this script checks next URLs.

## Usage

```
./check_response_http_code {TargetUrlList}
```

## Example
```
./check_response_http_code target-file-example.txt
```

