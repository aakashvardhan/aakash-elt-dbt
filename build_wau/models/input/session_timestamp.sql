SELECT
    sessionId,
    ts
FROM {{ source('raw', 'session_timestamp') }}
WHERE sessionId is not NULL
