# meteordemod

```
docker build . -t meteordemod-80k
docker build . -t meteordemod-72k

docker run -v `pwd`:/data --rm meteordemod baseband_137900000Hz_11-09-41_12-08-2023.wav 
```

```
docker run -v `pwd`:/data --rm meteordemod -m oqpsk -int 1 -diff 1 -s 80e3 -sat METEOR-M-2-3 -t weather.tle -f png -o . -i baseband_137900000Hz_11-09-41_12-08-2023.wav 
```