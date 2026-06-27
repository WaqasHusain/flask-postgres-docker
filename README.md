# Flask + PostgreSQL Docker Compose Project

![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker)
![Python](https://img.shields.io/badge/Python-3.11-green?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql)
![Red Hat](https://img.shields.io/badge/EX188-Exam%20Prep-red?logo=redhat)

A multi-container application demonstrating Docker Compose with Flask and PostgreSQL. Built as part of **Red Hat EX188 (Containers) exam preparation**.

---

## Project Structure

```
flask-postgres-docker/
├── app.py                # Flask application
├── Dockerfile            # Custom image build instructions
├── requirements.txt      # Python dependencies
├── docker-compose.yml    # Multi-container orchestration
└── README.md
```

---

## Concepts Covered

| Concept | Implementation |
|---|---|
| Custom image build | `build: .` triggers Dockerfile |
| Named volume | `pgdata` persists DB data across restarts |
| Custom network | `app-net` — containers communicate by service name |
| Environment variables | Injected at runtime, not baked into image |
| `depends_on` | Controls startup order |
| Multi-container setup | Flask web app + PostgreSQL database |

---

## How to Run

**Start all containers:**
```bash
docker compose up -d
```

**Verify containers are running:**
```bash
docker compose ps
```

**Test the app:**
```bash
curl http://localhost:5000
```

**Tear down (keep volume):**
```bash
docker compose down
```

**Tear down (delete volume too):**
```bash
docker compose down -v
```

---

## EX188 Exam Relevance

This project maps directly to the following EX188 objectives:
- Building custom container images using a Containerfile/Dockerfile
- Running multi-container applications
- Using environment variables for configuration
- Persisting data using named volumes
- Networking containers using custom bridge networks

---

## Author

**Waqas Husain**  
OSS Engineer @ Cisco | Red Hat Certified Engineer | RHCA Candidate  
[GitHub](https://github.com/WaqasHusain)
