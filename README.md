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

- Ran `dbt run` to execute the above SQL statements defined in the project

![wau2](https://raw.githubusercontent.com/aakashvardhan/aakash-elt-dbt/main/screenshots/dbt-run.png)

## Set up Output Models

- Takes the input data (CTE-based input models) and performs various transformations into a clean dataset, in this case `session_summary`.

```sql
SELECT u.userId, u.sessionId, u.channel, st.ts
FROM {{ ref("user_session_channel") }} u
JOIN {{ ref("session_timestamp") }} st ON u.sessionId = st.sessionId
```
![wau2](https://raw.githubusercontent.com/aakashvardhan/aakash-elt-dbt/main/screenshots/dbt-run-session-summary.png)


