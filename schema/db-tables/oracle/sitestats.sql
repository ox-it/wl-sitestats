create table SST_EVENTS (ID number(19,0) not null, USER_ID varchar2(99 char) not null, SITE_ID varchar2(99 char) not null, EVENT_ID varchar2(32 char) not null, EVENT_DATE date not null, EVENT_COUNT number(19,0) not null, primary key (ID));
create table SST_JOB_RUN (ID number(19,0) not null, JOB_START_DATE timestamp, JOB_END_DATE timestamp, START_EVENT_ID number(19,0), END_EVENT_ID number(19,0), LAST_EVENT_DATE timestamp, primary key (ID));
create table SST_PREFERENCES (ID number(19,0) not null, SITE_ID varchar2(99 char) not null, PREFS clob not null, primary key (ID));
create table SST_PRESENCES (ID number(19,0) not null, SITE_ID varchar2(99 char) not null, USER_ID varchar2(99 char) not null, DATE date not null, DURATION number(19,0) default 0 not null, LAST_VISIT_START_TIME timestamp default null, primary key (ID));
create table SST_REPORTS (ID number(19,0) not null, SITE_ID varchar2(99 char), TITLE varchar2(255 char) not null, DESCRIPTION clob, HIDDEN number(1,0), REPORT_DEF clob not null, CREATED_BY varchar2(99 char) not null, CREATED_ON timestamp not null, MODIFIED_BY varchar2(99 char), MODIFIED_ON timestamp, primary key (ID));
create table SST_RESOURCES (ID number(19,0) not null, USER_ID varchar2(99 char) not null, SITE_ID varchar2(99 char) not null, RESOURCE_REF varchar2(255 char) not null, RESOURCE_ACTION varchar2(12 char) not null, RESOURCE_DATE date not null, RESOURCE_COUNT number(19,0) not null, primary key (ID));
create table SST_SITEACTIVITY (ID number(19,0) not null, SITE_ID varchar2(99 char) not null, ACTIVITY_DATE date not null, EVENT_ID varchar2(32 char) not null, ACTIVITY_COUNT number(19,0) not null, primary key (ID));
create table SST_SITEVISITS (ID number(19,0) not null, SITE_ID varchar2(99 char) not null, VISITS_DATE date not null, TOTAL_VISITS number(19,0) not null, TOTAL_UNIQUE number(19,0) not null, primary key (ID));
create index SST_EVENTS_USER_ID_IX on SST_EVENTS (USER_ID);
create index SST_EVENTS_SITE_ID_IX on SST_EVENTS (SITE_ID);
create index SST_EVENTS_SITEEVENTUSER_ID_IX on SST_EVENTS (USER_ID, SITE_ID, EVENT_ID);
create index SST_EVENTS_EVENT_ID_IX on SST_EVENTS (EVENT_ID);
create index SST_EVENTS_DATE_IX on SST_EVENTS (EVENT_DATE);
create index SST_PREFERENCES_SITE_ID_IX on SST_PREFERENCES (SITE_ID);
create index SST_PRESENCE_DATE_IX on SST_PRESENCES (DATE);
create index SST_PRESENCE_USER_ID_IX on SST_PRESENCES (USER_ID);
create index SST_PRESENCE_SITE_ID_IX on SST_PRESENCES (SITE_ID);
create index SST_PRESENCE_SITEUSERDATE_ID_IX on SST_PRESENCES (SITE_ID, USER_ID, DATE);
create index SST_REPORTS_SITE_ID_IX on SST_REPORTS (SITE_ID);
create index SST_RESOURCES_USER_ID_IX on SST_RESOURCES (USER_ID);
create index SST_RESOURCES_SITE_ID_IX on SST_RESOURCES (SITE_ID);
create index SST_RESOURCES_RES_ACT_IDX on SST_RESOURCES (RESOURCE_ACTION);
create index SST_RESOURCES_DATE_IX on SST_RESOURCES (RESOURCE_DATE);
create index SST_SITEACTIVITY_EVENT_ID_IX on SST_SITEACTIVITY (EVENT_ID);
create index SST_SITEACTIVITY_DATE_IX on SST_SITEACTIVITY (ACTIVITY_DATE);
create index SST_SITEACTIVITY_SITE_ID_IX on SST_SITEACTIVITY (SITE_ID);
create index SST_SITEVISITS_DATE_IX on SST_SITEVISITS (VISITS_DATE);
create index SST_SITEVISITS_SITE_ID_IX on SST_SITEVISITS (SITE_ID);
create sequence SST_EVENTS_ID;
create sequence SST_JOB_RUN_ID;
create sequence SST_PREFERENCES_ID;
create sequence SST_PRESENCE_ID;
create sequence SST_REPORTS_ID;
create sequence SST_RESOURCES_ID;
create sequence SST_SITEACTIVITY_ID;
create sequence SST_SITEVISITS_ID;
