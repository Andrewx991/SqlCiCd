# CI/CD for SQL Databases

This repo is meant to demonstrate a development process that can help simplify CI/CD for SQL Databases.


## The premise

Some SQL scripts can be written in a declaritive & idempotent manner that makes them safe to run multiple times. Some cannot however because they would cause data loss or poor database performace. This process relies on the developers knowing the difference and being able to write declaritive & idempotent sql scripts where possible.

Using the folder convention defined by the tool, we will organize our scripts in a way that lets the tool know which scripts are safe to run and when.

Based on that folder convention the tooling automates database creation and updates. The tool can track the state for us, and since the folder structure tells it which scripts are safe to run and when, it can minimze the amount of state it tracks and give us some safety in the event someone modifies a non-idempotent script by accident.

## The tool

In this example I am using a tool called [Roundhouse](https://github.com/chucknorris/roundhouse/wiki) which handles running the scripts and state tracking.

## The folder convention

Roundhouse requires you organize your SQL scripts into folders based on when they can run.

| When| Folder | Types of scripts |
| ---- | ------ | ----------- |
| One Time | up     | Scripts you only want to run once, such as schema changes (DDL) or data manipulations (DML) |
| Any Time | functions, views, sprocs, indexes | Scripts that can be run any time. Usually follows `CREATE IF NOT EXIST ... ALTER` pattern. |
| Everytime | permissions | Scripts that shold be run every time.  |

## Sample Scenario

These instructions will walk you through initial database setup as well as making a change to that database. I have provided a sample solution (`Example.sln`) that contains a project and some initial sql scripts.

> **Note**: Scenario assumes you have a local Sql Server instance and that you have `sa` permission on that database.

### Intro

Open `Example.sln`, and take a look at the `Database` folder. You will see three subfolders:

* `Deployment` - Contains the roundhouse exe and powershell scripts for your CI/CD pipeline.
* `SQL` - Contains the initial SQL for the example, organized into Roundhouse folder convention, and a file for versioning.
* `SqlChangesForDemo` - Premade SQL changes I have provided that we will use to walk through making a change.

Take a look at the scripts in the `SQL` folder. These scripts setup a database that has two tables and some common sql objects such as views, stored procedures, functions, indexes and permissions.

You may notice some boilerplate sql in some sql files. This is used to make those scripts idempotent and thus we don't need to track if we ran them.

### Inital database setup

Run the `UpdateDatabase.ps1` script.

You now should have a database called `MySqlCiCdExampleDatabase`. 

Feel free to run `UpdateDatabase.ps1` again as many times as you like, if you followed the convention (which the example does), it is an idempotent command.

### Dropping a column

Dropping a column is a one-time only change, thus we are going to put it the `up` folder per Roundhouse convention.

In the `SqlChangesForDemo` folder you will find `000000002_DeleteColumn.sql`. Move that file into the `SQL\up` folder.

Run the `UpdateDatabase.ps1` which will run our new change.

### Alter a stored procedure

Since a change to a stored procedure can be run anytime we will just edit the `GetEventsDuringTimeframe.sql`.

In that script add `SET NOCOUNT ON` about the `SELECT *`.

Run the UpdateDatabase.ps1 which will re-run that script, applying our change.

### Making a change to a one-time only script

In the `000000001_Initial_Schema.sql` change the name of the `WhoopsThisIsntSupposedToBeHere` column to `ThisIsSupposedToBeHereNow`.

Via powershell, `cd` to the `Deployment` folder and run the `UpdateDatabase.ps1`.
You will notice it threw an error. This is because we changed a script that by convention should never change once it has already ran. Instead this change should be made via an `ALTER TABLE` command in a different one time script.