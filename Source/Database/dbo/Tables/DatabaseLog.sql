﻿-- Audit table tracking all DDL changes made to the database. Data is captured by the database trigger ddlDatabaseTriggerLog.
CREATE TABLE [dbo].[DatabaseLog] (
    [DatabaseLogID] INT            IDENTITY (1, 1) NOT NULL, -- Primary key for DatabaseLog records.
    [PostTime]      DATETIME       NOT NULL,                 -- The date and time the DDL change occurred.
    [DatabaseUser]  [sysname]      NOT NULL,                 -- The user who implemented the DDL change.
    [Event]         [sysname]      NOT NULL,                 -- The type of DDL statement that was executed.
    [Schema]        [sysname]      NULL,                     -- The schema to which the changed object belongs.
    [Object]        [sysname]      NULL,                     -- The object that was changed by the DDL statement.
    [TSQL]          NVARCHAR (MAX) NOT NULL,                 -- The exact Transact-SQL statement that was executed.
    [XmlEvent]      XML            NOT NULL,                 -- The raw XML data generated by database trigger.
    CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY CLUSTERED ([DatabaseLogID] ASC) -- Primary key constraint
);
