;;; This code is written by Mikko Vanhatalo <mv@exilis.xyz> and placed in
;;; the Public Domain. All warranties are disclaimed.

(module stb-image-write *

(import chicken scheme foreign)

(foreign-declare "#define STB_IMAGE_WRITE_IMPLEMENTATION")
(foreign-declare "#include \"stb_image_write.h\"")

;;; STBI-WRITE-PNG path width height color-components image-data stride
(define stbi-write-png
  (foreign-lambda bool "stbi_write_png" c-string int int int blob int))

;;; STBI-WRITE-BMP path width height color-components image-data
(define stbi-write-bmp
  (foreign-lambda bool "stbi_write_bmp" c-string int int int blob))

;;; STBI-WRITE-TGA path width height color-components image-data
(define stbi-write-tga
  (foreign-lambda bool "stbi_write_tga" c-string int int int blob))

;;; STBI-WRITE-HDR path width height color-components image-data
(define stbi-write-hdr
  (foreign-lambda bool "stbi_write_hdr" c-string int int int (c-pointer float)))

)
