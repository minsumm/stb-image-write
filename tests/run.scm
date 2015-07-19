;;; This code is written by Mikko Vanhatalo <mv@exilis.xyz> and placed in
;;; the Public Domain. All warranties are disclaimed.

(require-extension test)
(require-extension stb-image-write)
(require-extension srfi-4)
(require-extension lolevel)

(define *width* 320)
(define *height* 240)
(define *components* 3)

(test "tga" #t
      (let ((data (make-u8vector (* *width* *height* *components*) 0)))
        (stbi-write-tga "test.tga"
                        *width*
                        *height*
                        *components*
                        (u8vector->blob data))))

(test "png" #t
      (let ((data (make-u8vector (* *width* *height* *components*) 0)))
        (stbi-write-png "test.png"
                        *width*
                        *height*
                        *components*
                        (u8vector->blob data)
                        0)))

(test "bmp" #t
      (let ((data (make-u8vector (* *width* *height* *components*) 0)))
        (stbi-write-bmp "test.bmp"
                        *width*
                        *height*
                        *components*
                        (u8vector->blob data))))

(test "hdr" #t
      (let ((data (make-f32vector (* *width* *height* *components*) 1.0)))
         (stbi-write-hdr "test.hdr"
                         *width*
                         *height*
                         *components*
                         (object->pointer (f32vector->blob data)))))

(test-exit)
