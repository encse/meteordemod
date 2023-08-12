# MeteorDemod wrapper

This repo contains a Dockerfile to make building and using [MeteorDemod](https://github.com/Digitelektro/MeteorDemod) easier.

## Building

If you have docker, it's as simple as:

```bash
docker build . -t meteordemod
```

## Usage

I added `meteordemod.sh` to the repo, to make working with the image easier. Technically it just mounts your current 
working directory under `/data` in the container and forwards arguments to the underlying `meteordemod` executable.

I also added some templates to make my usecase less verbose. If I need to extract something I can just write:

```bash
./meteordemod.sh 72k inputfile.wav 
```
or

```bash
./meteordemod.sh 80k inputfile.wav
```

An other common task is to update the TLE of the satellite, I do this with:

```bash
./meteordemod.sh download-tle
```

this puts `weather.tle` into the current directory, obtained from https://celestrak.org.

## Backdoor 

If I need to go deeper I can just invoke the script with some other arguments such as:

```bash
./meteordemod.sh -m oqpsk -diff 1 -s 72e3 -sat METEOR-M-2-3 -t weather.tle -f png ...
```
