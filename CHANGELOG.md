## 0.0.4

* Update readme file

## 0.0.3

* Fixed deprecated Color properties:
  - Updated `toHex()` method to use non-deprecated getters (`a`, `r`, `g`, `b` instead of `alpha`, `red`, `green`, `blue`)
  - Fixed color component conversion from normalized values (0.0-1.0) to 0-255 range
  - Updated tests to use `toARGB32()` instead of deprecated `.value` property
* Improved compatibility with latest Flutter versions


## 0.0.2

* Added gitHub repository

## 0.0.1

* Initial release:
  - Added hex to color methods
  - Added unitary test

