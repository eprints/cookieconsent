# Cookie Consent
This ingredient provides customisable dialogs for accepting anr/or rejecting cookies. It makes use of the
[Orest Bida's vanilla JavaScript Cookie Consent](https://github.com/orestbida/cookieconsent) project, (currently using version 2.9.1).  This has been customised to make it easier to deploy and configure for an EPrints repository archive.

## Usage

1. Deploy this ingredient in the ingredients directory of your EPrints 3.4+ repository installation
2. Enable the ingredient in the appropriate flavour's inc file (EPrints 3.4) or archive's package.yml file (EPrints 3.5).
3. Copy static/javascript/cookieconsent\_config.js.tmpl to you archive's static/javascript directory renaming it cookieconsent\_config.js
4. Modify the cookie\_table blocks within the various sections of the JSON contained with this file to incorporate all the cookies used by the archive.  You may need to add extra sections for different types of cookie not conclude in the template file.
5. Reload the webserver hosting your EPrints repository.

## Advice on Configuration
**TO BE WRITTEN**

For further advice see [Orest Bida's readme file](https://github.com/orestbida/cookieconsent/blob/master/Readme.md).
