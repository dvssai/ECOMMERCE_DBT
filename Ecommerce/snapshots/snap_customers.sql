{% snapshot snap_customers %}

    {{ config(
        target_schema = 'snapshots',
        unique_key = ['CustomerID', 'CustomerUniqueID'],
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = true
    ) }}

    SELECT {{dbt_utils.generate_surrogate_key(['CustomerID', 'CustomerUniqueID'])}} as surrogate_key,
    CustomerID,CustomerUniqueID,ZipCode,City,
    CAST(updated_at as timestamp_ntz) as updated_at
    FROM {{ ref('Int_customers') }}

{% endsnapshot %}