# DAT250 SecureApp — Networking Troubleshooting

## Docker is not running

```bash
docker compose ps
```

If services are not listed as running, start Docker Desktop/Engine and run:

```bash
docker compose up --build
```

## Port already in use

Another local service may already use port 18181 or 8025.

```bash
docker compose down
docker compose ps
```

Then stop conflicting local services and restart the lab.

## Cannot reach app from Kali VM

Checklist:
- Is Docker Compose running?
- Is the target IP correct?
- Are the VMs on the same virtual network?
- Is the firewall blocking inbound connections?
- Is the app reachable from the host first?
- Try curl from the target machine:
  `curl -I http://localhost:18181`
- Try curl from Kali:
  `curl -I http://<TARGET-IP>:18181`

## VirtualBox/VMware/UTM/Parallels notes

- NAT can be difficult for inbound connections.
- Bridged networking often makes the VM visible on the same LAN.
- Host-only networking is good for isolated lab networks.
- Internal network works only between VMs configured with the same internal network name.

## Safety

Never scan public networks or UiS infrastructure.
