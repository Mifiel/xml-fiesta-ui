# XMLFiesta UI

Offline verifyer for Mifiel generated XMLs. Visit http://mifiel.github.io/xml-fiesta-ui for the online version.

## Development

Before you start to develop you must install node, npm and bower.

> You will need to input your password in steps **1** and **2**.

1. Download node at https://nodejs.org/ and install it
2. Install npm: `sudo npm install npm -g`
3. Install bower: `sudo npm install bower -g`
4. Clone the repo: `git clone git@github.com:Mifiel/xml-fiesta-ui.git && cd xml-fiesta-ui`
5. Install dependencies: `npm install && bower install`
6. Run the server and you're ready to party: `grunt serve`

## Build

Run `grunt` for building and `grunt gh-pages` to publish it.

## Testing

Running `grunt test` will run the unit tests with karma ones and `grunt test:ci` will run the tests every time you make changes in the code.
