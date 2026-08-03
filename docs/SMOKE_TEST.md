# DAT250 SecureApp Smoke Test

Use this quick check after `docker compose up --build -d` or after a reset.

## 1) Service status

```bash
docker compose ps
```

Expected: `nginx`, `backend`, `db`, `mailhog`, `phppgadmin` are `Up`.

## 2) HTTP endpoint checks

```bash
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:18181/
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8025/
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8081/
curl -s http://localhost:18181/health
```

Expected:
- `18181` returns `200`
- `8025` returns `200`
- `8081` returns `200`
- `/health` returns `{"status":"ok"}`

## 3) Seeded login + dashboard

```bash
curl -s -c /tmp/dat250.cookies \
  -d "email=alice@student.uis.no&password=Alice123" \
  -X POST -D /tmp/dat250_login_headers.txt \
  -o /tmp/dat250_login_body.html \
  http://localhost:18181/login

curl -s -b /tmp/dat250.cookies \
  -D /tmp/dat250_dashboard_headers.txt \
  -o /tmp/dat250_dashboard_body.html \
  http://localhost:18181/dashboard
```

Expected:
- Login returns `302` to `/dashboard`
- Dashboard returns `200`
- Dashboard page contains `Dashboard` and `Welcome,`

## 4) Password reset + MailHog

```bash
curl -s -d "email=alice@student.uis.no" \
  -X POST http://localhost:18181/reset-password \
  -o /tmp/dat250_reset_response.html

curl -s http://localhost:8025/api/v2/messages
```

Expected:
- At least one message exists in MailHog API output
- Message for `alice@student.uis.no` contains a reset link path like `/reset-password/<token>`

## 5) Optional DB GUI check

Open `http://localhost:8081` and use:
- Username: `dat250`
- Password: `dat250`

Expected: successful login to PostgreSQL server view.
