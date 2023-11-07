# Cookie Consent
This ingredient provides customisable dialogs for accepting anr/or rejecting cookies. It makes use of the
[Orest Bida's vanilla JavaScript Cookie Consent](https://github.com/orestbida/cookieconsent) project, (currently using version 2.9.1).  This has been customised to make it easier to deploy and configure for an EPrints repository archive.

## Usage

1. Deploy this ingredient in the ingredients directory of your EPrints 3.4+ repository installation
2. Enable the ingredient in the appropriate flavour's inc file (EPrints 3.4) or archive's package.yml file (EPrints 3.5).
3. Copy static/javascript/auto/cookieconsent\_config.js.tmpl to you archive's static/javascript/auto/ directory renaming it cookieconsent\_config.js.
4. In your archive's static/javascript/auto/cookieconsent\_config.js, update ".HOSTNAME" to the hostname of your EPrints repository (e.g. "eprints.example.org").
5. Modify the cookie\_table blocks within the various sections of the JSON contained with this file to incorporate all the cookies used by the archive.  You may need to add extra sections for different types of cookie not conclude in the template file.
6. Ensure that the attribute "data-cookiecategory" is added to each script element that deploys cookies.
7. Reload the webserver hosting your EPrints repository.

## Advice on Configuration
- The "data-cookiecategory" by default can take one of theree values: "necessary", "analytics" or "targeting".
- Built-in default cookies for EPrints such as "eprint\_session", "secure\_eprint\_session" and "eprints\_lang" are invoked using Perl code so no changes are required to keep these working.  These are already described in cookieconsent\_config.js.tmpl
- If you have used JavaScript to invoke any other cookies, which are essential to the running of your EPrints repository then the "data-cookiecategory" attribute for this script element should be set to "necessary".
- If you are adding any JavaScript that invokes a cookie, this must be added to all page templates that require this cookie.  It must also be added after the epc:pin with ref "head".
- When you have added the JavaScript that invokes the cookie, you must update cookieconsent\_config.js and add the "Name" "Domain", "Expiration" and "Description" for that cookie to the appropriate table (e.g. "Strictly necessary cookies", "Performance and Analytics cookies" or "Advertising and Targeting cookies"). 
- Any script elements added to a template after the epc:pin with ref "head" must have a "data-cookiecategory" attribute. If they do not, whatever cookie settings the user choose this JavaScript is liable not to be loaded.
- If you are not invoking any cookies except the built-in default cookies for EPrints, you should update cookieconsent\_config.js to remove reference to the Google Analytics (i.e. "^_ga") cookies under "Performance and Analytics cookies".

For further advice see [Orest Bida's readme file](https://github.com/orestbida/cookieconsent/blob/master/Readme.md).
