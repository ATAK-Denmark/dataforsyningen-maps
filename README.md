# Dataforsyningen maps
---
Maps of Denmark from [dataforsyningen.dk](https://dataforsyningen.dk/)

## Status



## Setup

#### Step 1:
  - Sign up on [Dataforsyningens](https://dataforsyningen.dk/) and create a [token](https://dataforsyningen.dk/user#token)
    - Guide to create token [here](https://confluence.sdfi.dk/display/MYD/Log+ind+og+Token)
  - Download and unpack the repro [files](https://github.com/ATAK-Denmark/dataforsyningen-maps/archive/refs/heads/main.zip)

#### Step 2: (Mac or Linux)
  - Create a `.env` file (template included) and put in the token
  - Run the `token.sh` script

#### Step 2: (Windows)
  - Search and replace for `replaceme` in the .xml files in the `source/` folder. Your favorite editor should be able to do this.

#### Step 4:
  - Copy the folders in `source/` to the `atak` folder on your Android Phone
    - I used [OpenMTP](https://openmtp.ganeshrvel.com/) for Apple OSX

## Requirements
  - Scripts only tested on Apple OSX
  - Map files only tested on Android 13 (LineageOS 20) (Samsung S9, ATAK v5.3)