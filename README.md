# DBT Project with Snowflake Connector

## Create a DBT project with a Snowflake Connector

- Initialize a dbt project using `dbt init build_wau`

![wau1](https://raw.githubusercontent.com/aakashvardhan/aakash-elt-dbt/main/screenshots/dbt-init.png)

## Set Up Input Models

- Create Input tables as CTE under `build_wau/models/input`

`models/input/user_session_channel.sql`

```sql

SELECT
    userid,
    sessionId,
    channel
FROM {{ source('raw', 'user_session_channel') }}
WHERE sessionId IS NOT NULL

```

---

`models/input/session_timestamp.sql`

```sql
SELECT
    sessionId,
    ts
FROM {{ source('raw', 'session_timestamp') }}
WHERE sessionId is not NULL
```


