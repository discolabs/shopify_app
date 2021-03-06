7.2.6
-----
* Update LoginProtection#fullpage_redirect_to to get shopify domain from session
  [[#401]](https://github.com/Shopify/shopify_app/pull/401)

7.2.5
-----
* Update LoginProtection.redirection_javascript to work with absolute URLS
  [[#389]](https://github.com/Shopify/shopify_app/pull/389)

7.2.4
-----
* Fix redirect issue by sanitizing shop name on sessions#new

7.2.3
-----
* Use postMessage to redirect parent iframe during authentication [[#366]](https://github.com/Shopify/shopify_app/pull/366)
* Add support for dynamically generating scripttag URLs
* Bug-fix: Update scripttags_manager_job
* Bug-fix: `--application_name` and `--scope` generates proper Configuration even when options supplied to them contain whitespaces.

7.2.0
-----
* Disable application layout rendering for the `/login` page

7.1.1
-----
* Lower required Ruby version to 2.2.2 to better match up with Rails 5.0

7.1.0
-----
* Update login page copy
* Add application_name configuration option
* Add new optional App Proxy Controller Generator to the Engine. Refer README for details.
* Include ShopifyApp::LoginProtection in Authenticated and Session Controller directly instead of Application Controller.
* Loosen ShopifyAPI dependency requirements to `>= 4.2.2` and allow ShopifyAPI 4.3.0 and above.
* Move application.js to inside HEAD in Embedded App Template.
* Add ability to override the ActiveJob queue names in initializer file.

7.0.11
------
* Pass configured resources (like webhooks or scripttags) into the job rather than reading the config again. This allows for dynamically setting ShopifyApp config in a web request and having the job handle it correctly. This change does not affect the usage of webhooks or scripttags

7.0.10
------
* Loosen Rails dependency requirements to `>= 4.2.6` and allow Rails 5.0
* Add support for App Proxies

7.0.9
-----

* Remove http-equiv meta tag as it causes OAuth issues in Chrome

7.0.5
-----

* Remove obtrusive “Continue” text in redirects

7.0.4
-----

* Bump required shopify_api version to 4.x.

7.0.3
-----

* Bump required Rails version to `>= 4.2.6` since we are now using `ActiveSupport::SecurityUtils:Module`

7.0.2
-----

* Fix CSRF redirect issue

7.0.1
-----

* add support to i18n for flash messages (English and Spanish).

7.0.0
-----

* rename WebhooksController module to WebhookVerification
* added a WebhooksController which automatically delegates to jobs
* moved all engine controllers under the ShopifyApp namespace
* rename SessionsController module to SessionsConcern
* more robust redirects, with valid HTML in HTTP response bodies
* `ShopifyApp::Controller` has been removed. You’ll need to replace all includes of `ShopifyApp::Controller` with `ShopifyApp::LoginProtection`
* adds add_webhook generator to make it easier to add new webhooks to your app
* update the install generator to use standard rails generate arguments, usage has changed from `-api_key=your_key` to `--api_key your_key`
* remove the redirect uri - this is done automatically inside omniauth now

6.4.2
-----

* Update minimum required rails version to 4.2 to include active job

6.4.0
-----

* More semantic and accessible markup in the sessions/new, embedded_app, and product
  index views.
* Moved all JavaScript to load at the bottom of the page instead of the head, for
  page loading better performance.

6.3.0
-----

* Move SessionStorage from a generated class to a re-usable module. To
  migrate to the new module, delete the old generated SessionStorage class
  in the models directory and include the SessionStorage module in your Shop model.
* Adds a WebhooksManager class and allows you to configure what webhooks your app
  needs. The rest is taken care of by ShopifyApp provided you set up a backgroud queue
  with ActiveJob
* Adds a WebhooksController module which can be included to handle the boiler plate code
  for a controller receiving webhooks from Shopify

6.2.1
-----

* add callback url to omniauth provider
* add default redirect_uri

6.2.0
-----

* Return an HTTP 401 for XHRs that aren't logged in

6.1.3
-----
* add redirect_uri which is now required
* fix login again with different shop

6.0.0
-----
* Re-written as a proper rails engine
* New modular generators
* generates embedded apps by default
* can bootstrap your app with a standard shop table and model
* code now lives as concerns in the engine which are included in your controllers
  feel free to override anything you need in your app

Historical
----------
* re-styled with Twitter Bootstrap css framework and updated docs [warren]
* Require shopify_api gem via proper railtie setup [willem]
* Don't require shopify.yml when using environment variables [cody]
* Renamed instances of current_shop to shop_session to maintain logic
* Replace old LoginController with a RESTful SessionsController
