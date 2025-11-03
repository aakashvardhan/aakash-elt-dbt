{% snapshot snapshot_session_summary.sql %}

{{
    config(
        target_schema='snapshot',
        unique_key='sessionId',
        strategy='timestamp',
        updated_at='ts',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ ref('session_summary') }}

{% endsnapshot %}
