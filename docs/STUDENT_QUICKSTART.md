# Student Quickstart

1. Clone repository and open terminal in `dat250-secureapp`.
2. Run `docker compose up --build`.
3. Open `http://localhost:18181`.
4. Use provided test users to explore functionality.
5. Use external course tools where required by assignments.

## Access from Kali or another VM

- Same machine: open `http://localhost:18181`
- App on host + Kali VM: open `http://<HOST-IP>:18181`
- App in target VM + Kali in separate VM: open `http://<TARGET-VM-IP>:18181`
- App inside Kali: open `http://localhost:18181`

For detailed VM networking steps, read:
- `docs/KALI_VM_NETWORKING.md`
- `docs/NETWORKING_TROUBLESHOOTING.md`

## Login with test users

1. Open `http://localhost:18181`.
2. Click **Login** in the top menu.
3. Sign in with one of these accounts:

- `admin@dat250.local` / `Admin123`
- `teacher@dat250.local` / `Teacher123`
- `ta@dat250.local` / `TA123`
- `alice@student.uis.no` / `Alice123`
- `bob@student.uis.no` / `Bob123`
- `charlie@student.uis.no` / `Charlie123`

## Database GUI access (phpPgAdmin)

- URL: `http://localhost:8081`
- Available only if enabled in your lab setup.
- Server/Host: `db`
- Port: `5432`
- Database: `dat250`
- Username: `dat250`
- Password: `dat250`
