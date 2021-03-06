#!/bin/bash

echo '# robots.txt for https://mirrors.tuna.tsinghua.edu.cn' > robots.txt
echo 'User-agent: *' >> robots.txt
echo '' >> robots.txt
echo 'Disallow: /logs' >> robots.txt

curl -s https://mirrors.tuna.tsinghua.edu.cn/static/tunasync.json | jq -r '.[] | .name' | uniq | while read name; do
	[[ -z ${name} ]] && continue
	echo "Disallow: /${name}" >> robots.txt
done
