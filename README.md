###Google Summer of Code 2010
####Data Integration System for the Berkman Center at Harvard for Internet and Society

The Data Integration System is a set of two applications that can be used to search for and aggregate data about one or more URLs from several databases. It comprises a central application that enables users to search for information on a configurable set of databases and a REST API that can be deployed on the databases (MySQL, PostgreSQL, SQLite) to enable partial read-only access to the data.

* Project description - http://cyber.law.harvard.edu/gsoc/Data_Integration_DB

* Berkman Center - http://cyber.law.harvard.edu/

* Google Summer of Code - http://code.google.com/soc/


####Configuration and dependencies
The applications are configured to run on the version 2.5.5 of Ruby on Rails, and have the following dependencies:
* Main Application
	- cancan gem for authentication
	- authlogic gem for authentication 
	- database for configuration (MySQL, PostgreSQL, SQLite)
* Data API
	- SQLite for storing the configuration
	- install and configure the rails database driver for the type of repository being queried (MySQL, PostgreSQL, SQLite)

####Main Application
In the main application a user can search for information on a set of databases. The application has a web interface with a public area and an administration area. The web application contains the following groups of pages:
* Search - search for information in the directory of repositories
* Users - user management area
* Roles - roles management area
* Repositories - datasource management area
* Plugins - plugin management area

__Main Application - Search__

In the search page, a user can submit one or more URLs that are sent to data repositories for querying. The URLs should be inserted in the search text box separated by commas. Since the URL may not be normalized across the data silos, four variations of the URL are created at each search. Considering a search for data where the URL http://www.nytimes.com is submitted by the user, the following URL variations will be submitted to the repositories:
* http://www.nytimes.com
* http://www.nytimes.com/
* http://nytimes.com
* http://nytimes.com/

__Main Application - Users and Roles__

To distinguish users by what they are allowed to see and manage, three types of user groups or roles are defined:

1. Administrators - registered user. Can:
	* Search/query repositories
	* Users: view, assign roles, assign repositories, delete
	* Roles: view, create, delete, edit
	* Repositories: view, create, delete, edit
	* Plugins: view, create, delete, edit
2. Subscribers - registered user - Can:
	* Search/query repositories
3. Guests -  unregistered user - Can:
	* Search/query repositories

While all users have access to the search screen, the repositories that are queried on a search depend on the role of the user and on the permissions granted by the administrators. This association is made by role (each role has a set of repositories that its users can query) and by user (in addition to repositories defined in the user role, a user can have access to more repositories). Considering the following User A and Subscriber role:

* User A - has access to Repository1; belongs to the Role Subscriber
* Role Subscriber - grants access to Repository2, Repository3

if the User A makes a search on the directory the repositories Repository1, Repository2 and Repository3 are queried.

The Guest role should be used to define a set of publicly queriable repositories. While the search screen will always be accessible to everyone, if the Guest role has no repositories assigned to it no repositories will queried if a non-authenticated user makes a search.

By default, new registered users get the Subscriber role. Unregistered users have the Guest role assigned by default.

__Main Application - Repositories and Plugins__

Repositories are searchable data sources that are queried when a user submits one or more URLs for searching. Each repository is defined as follows:
* Name - name of the repository
* Uri - URI of the repository
* Plugin - plugin used to connect to the repository
* Description (optional)
* Username and password (optional) - authentication credentials

The connection to a repository is made by using a plugin. Currently the application contains one plugin to connect to the REST API mentioned before. New types of data sources can be added to the system either by defining a new plugin on the main application or by creating new REST apis that can read from data sources other than the ones currently supported.

__Main Application - Guidelines for implementing a plugins for a new type of repository__

The following steps are required to the add a new plugin to the system:
1. Implement a new plugin following the naming conventions described below
2. Add the plugin to the vendor/plugins folder of the application
3. Register the plugin on the web interface (administrator privileges required)

New plugins must follow the following name conventions:
* The name of the plugin SHOULD be suffixed by "_connector"
* The plugin MUST add a new method to the Host model that is suffixed by "_query" and starts with the prefix of the name of the plugin
* When configuring a plugin on the web application, the name used MUST be the name of the "_query" suffixed method added to the Host model with the "_query" suffix removed
* Example plugin naming:
	- Plugin name: rest_connector
	- Web interface name: rest
	- Method that the plugin add to the Host model: rest_query

__Data API__

The Data API is an application that can be used to expose a read-only REST interface for a MySQL, PostgreSQL or SQLlite database. The application defines a configurable SQL query that is expanded with a URI list included at each get request made to the application. For example, if the application is configured with the query "select name from websites where id in", a get request made to the application with the parameters {uri: "www.nytimes.com, www.guardian.co.uk"} would return the results of the query "select name from websites where id in ('www.nytimes.com', 'www.guardian.co.uk')". Only SELECT clauses are allowed in the SQL queries, being UPDATE and DELETE clauses blocked.

The application must be configured using the web interface (http://hostname/configurations) after deployment as follows:
* Query base - partial SQL query for search excluding the where clause
* Query where - where clause that will be concatenated to the query base
* Data field names and data field friendly names - column names. Both text boxes must be filled with the column names used in the query base with similar order. The friendly field names will be the ones presented to the end user (Ex. A column with the name id can be presented to the user as Identifier)
* Username and password - authentication credentials for remote access and configuration access.

The example described before in this section would be mapped to the configuration as follows:
* Query base - select name from websites
* Query where - where id in
* Data field names - name
* Data field friendly names - Name (can have an arbitrary name)
* Username and password - ********* 
