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
command
```
./check_response_http_code target-file-example.txt
```

result
```
200 : https://www.google.co.jp/
200 : https://www.yahoo.co.jp/
200 : https://twitter.com/
```

