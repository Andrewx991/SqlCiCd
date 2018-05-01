# CI/CD for SQL Databases

This repo is meant to demonstrate a development process that can help simplify CI/CD for SQL Databases.


## The premise

Some sql scripts can be written as idempotent scripts but some can't because they would cause data loss or poor database performace. This process relies on the developers knowing the difference and being able to write idempotent scripts where possible.

Using a folder convention, we will organize our scripts into the ones that are idempotent and the ones that aren't. 

Based on that folder convention we can use tooling to automate database creation and updates. The tool can track the state for us, but since the folder structure tells it which scripts are idempotent or not, it can minimze the amount of state it tracks and give us some safety in the event someone modifies a non-idempotent script by accident.

## The tool

In this example I am using a tool called [Roundhouse](https://github.com/chucknorris/roundhouse/wiki) which handles running the scripts and state tracking.
See [Intro to Roundhouse](IntroToRoundhouse.md) for more on how I use it in this example.

## Sample workflow

**TODO**