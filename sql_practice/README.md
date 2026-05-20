# Expanded SQL Practice Pack

This pack contains three expanded SQLite databases with realistic edge cases.

## Databases

- `shop.db`
  - 18 customers
  - 18 products
  - 26 orders
  - 40 order items

- `hr.db`
  - 8 departments
  - 22 employees
  - 10 projects
  - 26 employee-project assignments

- `streaming.db`
  - 12 users
  - 10 artists
  - 16 tracks
  - 34 plays

## Edge cases included

These are intentional. They are meant to make your SQL less naive.

- Customers/users with no activity
- Products/tracks never ordered or played
- NULL values in optional columns
- Zero-price products and zero-budget projects
- Cancelled, refunded, and pending statuses
- Inactive employees/users
- Salary ties and duration ties
- Sparse categories/departments
- Unknown countries/devices
- Discontinued products

## How to use

```bash
sqlite3 shop.db
```

Inside SQLite:

```sql
.tables
.schema customers
SELECT * FROM customers LIMIT 5;
```

Recommended GUI tools:

- DB Browser for SQLite
- DBeaver
- DataGrip
- VS Code SQLite extension

The `.sql` files are included so you can recreate each database from scratch.