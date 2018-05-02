# CI/CD for SQL Databases

This repo is meant to demonstrate a process that can help simplify CI/CD for SQL Databases.

What this process gets you:
* Allows you to write SQL as plain SQL, as opposed to relying on other syntax some tools might force.
* Allows you to store SQL as plain SQL files with your repo(s), as opposed to having to store them in a tool.
* Allows use of database differential tools so long as they can output plain SQL file(s).
* Encourages a convention that helps you think about SQL database changes.
* Gives you a single command to run to update your database.
* Per instance tracking of database state, so working with mutliple environments is straightforward.
* Doesn't couple you too a single tool; the tool here simply automates execution and tracks state, running manually does not require magic.

---

This process uses a tool called [Roundhouse](https://github.com/chucknorris/roundhouse). This tool does two things:
* Automates execution of your SQL scripts
* Tracks which scripts it has already ran for your database

The tooling requires that you organize and write your SQL scripts in a certian manner based on when they can be executed. Conceptually, there are three categories:
* One Time Scripts - Scripts that you only want to run once per database instance, such as DDL or DML.
* Anytime Scripts - Scripts that can be run at anytime, such as scripts that create/alter functions, indexes, views and stored procedures.
* Everytime Scripts - Scripts that can & should be run everytime, such as permissions.

By organizing your SQL this way Roundhouse can automate updating your database.
* It knows that it should only run 'One Time' scripts once, so it tracks if it ran them yet for each instance and if not it runs them.
* It knows that it can run 'Anytime' scripts whenever, so it runs them if they have changed since it's last run.
* It knows that it should run 'Everytime' scripts everytime, so it just runs them.

---

## The folder structure

As mentioned, Roundhouse requires organizing your SQL into specific groups, usually I place these folders in a SQL folder inside my project's repo.

**One Time Scripts**

* Folder Name: `up`
* Naming Convention: Whatever you want so long as they get sorted in desired run order.
  * Eg: 0001-Initial.sql, 0002-NextChange.sql

**Anytime Scripts**

* Folder names: `functions, indexes, sprocs, views`
* Naming convention: Whatever you want.

**Everytime Scripts**

* Folder name: `permissions`
* Naming convention: Whatever you want.

For full folder list and conventions see the [Roundhouse documentation](https://github.com/chucknorris/roundhouse/wiki#scripts).

---

## Running Roundhouse

`rh.exe /s={databaseServer} /d={databaseName} /vf={versionFile} /f={SqlFolder}`