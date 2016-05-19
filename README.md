# XMLFiesta UI

Offline verifyer for Mifiel generated XMLs. Visit http://mifiel.github.io/xml-fiesta-ui for the online version.

## Development

Before you start to develop you must:

> You will need to input your password in steps **2** to **5**.

1. Download node at https://nodejs.org/ and install it
2. Install npm: `sudo npm install npm -g`
3. Install bower: `sudo npm install bower -g`
4. Install grunt: `sudo npm install grunt-cli -g`
5. Install compass: `sudo gem install compass`
6. Clone the repo: `git clone git@github.com:Mifiel/xml-fiesta-ui.git && cd xml-fiesta-ui`
7. Install dependencies: `npm install && bower install`
8. Run the server and you're ready to party: `grunt serve`

## Build

Run `grunt` for building and `grunt gh-pages` to publish it.

## Testing

Running `grunt test` will run the unit tests with karma ones and `grunt test:ci` will run the tests every time you make changes in the code.
