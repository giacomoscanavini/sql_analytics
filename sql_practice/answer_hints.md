# Answer Hints

These are not full answers. They nudge you toward the right SQL patterns.

## Patterns you will need

- `LEFT JOIN` for records with no related rows.
- `COALESCE()` when NULL should become 0 or "Unknown".
- `CASE WHEN` for conditional revenue and status logic.
- `GROUP BY` with `HAVING` for grouped filters.
- Window functions such as `RANK()` and `ROW_NUMBER()`.
- CTEs with `WITH` to make multi-step queries readable.

## Example pattern: find records with no matches

```sql
SELECT p.product_id, p.product_name
FROM products AS p
LEFT JOIN order_items AS oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
```

## Example pattern: completed revenue

```sql
SELECT
    o.order_id,
    SUM(oi.quantity * oi.unit_price) AS completed_revenue
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
WHERE o.status IN ('paid', 'shipped')
GROUP BY o.order_id;
```

## Example pattern: ranking with ties

```sql
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```