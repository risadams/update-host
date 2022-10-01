# Update-Host

## Description

This is a simple script to update the hosts file on Linux systems.
It accepts a file with a list of URLS and updates the hosts file with the IP addresses of the URLS.

The intention is to use this script locally on a linux system with internet access so that you can whitelist a list of URLS for a specific machine that would not otherwise have access.
Maintain a list of URLS in a file and run the script to update entries in an output file that can be copied to the destination machine's hosts file.

## Usage

```sh

sudo ./update-host.sh input_file output_file

```

## Contribute

If you think this could be better, please [open an issue](https://github.com/risadams/update-host/issues/new)!

Please note that all interactions in this organization fall under our [Code of Conduct](CODE_OF_CONDUCT.md).

## License

[MIT](LICENSE) © 1996+ Ris Adams
