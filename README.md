# mov-to-gif

Bulk convert `mov`, `mp4`, `m4v`, and other video files to `gif` using
[FFmpeg](http://ffmpeg.org) and [Gifsicle](http://www.lcdf.org/gifsicle/).

## Requirements

* [Docker](https://github.com/docker/docker) >= v1.8
* [Docker Compose](https://github.com/docker/compose) >= v1.2

## Directory Structure

Put you video files in the `input` directory. Corresponding `gif` files will be
available in the `output` directory.

```
.
|-- run.sh
|-- input
|   |-- video1.mov
|   |-- video2.mp4
|   `-- video3.m4v
`-- output
    |-- video1.gif
    |-- video2.gif
    `-- video3.gif
```

## Usage

```
./run.sh
```

## License

This project is licensed under the [MIT
License](https://github.com/Starefossen/mov-to-gif/blob/master/LICENSE).

Software contained in this project is licensed under the following licenses:

* FFmpeg: [GNU LGPLv2.1](http://ffmpeg.org/legal.html)
* Gifsicle: [GNU GPLv2](https://github.com/kohler/gifsicle/blob/master/COPYIN)
