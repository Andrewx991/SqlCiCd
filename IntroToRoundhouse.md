# How To Do SQL Development with Roundhouse

[Roundhouse](https://github.com/chucknorris/roundhouse/wiki)
is a tool that automates the execution of SQL scripts via folder/file conventions and does some state tracking for you in order to help simplify database CI/CD.

## How it works

1. Via folder/file convention, you tell Roundhouse whether a SQL Script should be run once, or if its safe to run multiple times.
1. It automates the execution of the scripts and for the non-idempotent ones it tracks whether it ran them or not.

## Understanding the convention

| Type of SQL Script | Assumed Idempotent? | Run Frequency | Why | Which folder to put script in |
| ------------------ | ----------------------- | ------------- | --- | ----------------------------- |
| Data Definition Language (DDL) | **NO** | Once |  Modifies database schema. |  `up` |
| Data Manipulation Language (DML) | **NO** | Once | Modifies database data. | `up` |
| Functions | Yes | Anytime | Idempotent | `functions` |
| Views | Yes | Anytime | Idempotent | `views` |
| Stored Procedures | Yes | Anytime | Idempotent | `sprocs` |
| Indexes | Yes | Anytime | Idempotent | `indexes` |
| Permissions | Yes | Everytime | Idempotent, allow speration of permissions from 'anytime' scripts. | `permissions` 

See [Roundhouse wiki](https://github.com/chucknorris/roundhouse/wiki) for full details.

## TODO: MORE

