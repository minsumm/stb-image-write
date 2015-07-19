# stb-image-write

## Description
CHICKEN Scheme egg for [stb_image_write](https://github.com/nothings/stb).

## Installation
Clone the repository and install with `chicken-install`.

## API
The API is essentially identical to the C API. `PIXELS` should be a SRFI-4
vector that is supplied as a `BLOB`, with the exception of `stbi-write-hdr`,
which needs a `c-pointer` as an argument. This can be achieved with
`object->pointer` from the module `lolevel`. (The C function signature is
different from the other three, taking a `float *` argument.)

    [procedure] (stbi-write-png PATH WIDTH HEIGHT PIXELS STRIDE)

    [procedure] (stbi-write-bmp PATH WIDTH HEIGHT PIXELS)

    [procedure] (stbi-write-tga PATH WIDTH HEIGHT PIXELS)

    [procedure] (stbi-write-hdr PATH WIDTH HEIGHT PIXELS)

## Examples

### Grayscale Plasma
    (require-extension srfi-4)
    (require-extension stb-write-image)

    (define (grayscale-plasma)
      (define (color x)
        (inexact->exact
         (fptruncate (fp+ 128.0
                          (fp* 128.0 (fpsin (fp/ (exact->inexact x) 8.0)))))))
      (let ((width 320)
            (height 240)
            (components 1))
        (let ((data (make-u8vector (* width height components) 0)))
          (let loop ((j 0))
            (if (< j height)
                (let loop2 ((i 0))
                  (if (< i width)
                      (begin
                        (u8vector-set! data
                                       (fx* (fx+ (fx* width j) i) components)
                                       (color i))
                        (loop2 (+ i 1)))
                      (loop (+ j 1))))))
          (stbi-write-png "plasma.png"
                          width
                          height
                          components
                          (u8vector->blob data)
                          0))))

## Version history
### Version 1.0 Initial release

## Author
Mikko Vanhatalo

## License
Public Domain