#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 [download-tle|72k|80k|*] [arguments...]"
    exit 1
fi

docker_command="docker run -v `pwd`:/data --rm meteordemod"

case "$1" in
    download-tle)
        url="http://celestrak.org/NORAD/elements/weather.txt"
        echo "Downloading $url to weather.tle"
        (curl -s -f $url > weather.tle && echo OK) || echo "failed"
        ;;
    72k)
        shift
        ${docker_command} -m oqpsk -diff 1 -s 72e3 -sat METEOR-M-2-3 -t weather.tle -f png $@
        ;;
    80k)
        shift
        ${docker_command} -m oqpsk -int 1 -diff 1 -s 80e3 -sat METEOR-M-2-3 -t weather.tle -f png $@
        ;;
    *)
        ${docker_command} $@
        ;;
esac


