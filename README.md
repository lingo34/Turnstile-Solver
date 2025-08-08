<div align="center">
 
  <h2 align="center">Cloudflare - Turnstile Solver</h2>
  <p align="center">
A Python-based Turnstile solver using the patchright library, featuring multi-threaded execution, API integration, and support for different browsers. It solves CAPTCHAs quickly and efficiently, with customizable configurations and detailed logging.
    <br />
    <br />
    <a href="https://github.com/Theyka/Turnstile-Solver#-changelog">📜 ChangeLog</a>
    ·
    <a href="https://github.com/Theyka/Turnstile-Solver/issues">⚠️ Report Bug</a>
    ·
    <a href="https://github.com/Theyka/Turnstile-Solver/issues">💡 Request Feature</a>
  </p>

  <p align="center">
    <img src="https://img.shields.io/badge/LICENSE-CC%20BY%20NC%204.0-red?style=for-the-badge"/>
    <img src="https://img.shields.io/github/stars/Theyka/Turnstile-Solver.svg?style=for-the-badge&color=red"/>
    <img src="https://img.shields.io/github/issues/Theyka/Turnstile-Solver?style=for-the-badge&color=red"/>
    <a href="https://t.me/codarea">
     <img src="https://img.shields.io/badge/Telegram%20Channel-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white"/>
    </a>
  </p>
</div>

---

### 🎁 Donation

- **USDT (TRC20)**: ``TWXNQCnJESt6gxNMX5oHKwQzq4gsbdLNRh``
- **USDT (Arbitrum One)**: ``0xd8fd1e91c8af318a74a0810505f60ccca4ca0f8c``
- **BTC**: ``13iiMaYFpCfNdcyFycSdSVmD2yfQciD7AQ``
- **LTC**: ``LSrLQe2dfpDhGgVvDTRwW72fSyC9VsXp9g``

---

### ❓ Looking for a Cheap or Custom CAPTCHA Solution?
- Need cheap captcha solution as low as 0.1$ per 1k ? Contact me on Telegram:

  <a href="https://t.me/tlb_sh">
    <img src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white"/>
  </a>

---

### ❗ Disclaimers
- I am not responsible for anything that may happen, such as API Blocking, IP ban, etc.
- This was a quick project that was made for fun and personal use if you want to see further updates, star the repo & create an "issue" [here](https://github.com/Theyka/Turnstile-Solver/issues/)

---

### ⚙️ Installation Instructions

1. **Ensure Python 3.8+ is installed** on your system.

2. **Create a Python virtual environment**:
   ```bash
   python -m venv venv
   ```

3. **Activate the virtual environment**:
   - On **Windows**:
     ```bash
     venv\Scripts\activate
     ```
   - On **macOS/Linux**:
     ```bash
     source venv/bin/activate
     ```

4. **Install required dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

5. **Select the browser to install**:
   You can choose between **Chromium**, **Chrome**, **Edge** or **Camoufox**:
   - To install **Chromium**:
     ```bash
     python -m patchright install chromium
     ```
   - To install **Chrome**:
     - On **macOS/Windows**: [Click here](https://www.google.com/chrome/)  
     - On **Linux (Debian/Ubuntu-based)**:
       ```bash
       apt update
       wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
       apt install -y ./google-chrome-stable_current_amd64.deb
       apt -f install -y  # Fix dependencies if needed
       rm ./google-chrome-stable_current_amd64.deb
       ```
   - To install **Edge**:
     ```bash
     python -m patchright install msedge
     ```
   - To install **Camoufox**:
     ```bash
     python -m camoufox fetch
     ```

6. **Start testing**:
   - Run the script (Check [🔧 Command line arguments](#-command-line-arguments) for better setup):
     ```bash
     python api_solver.py
     ```
     
---

### 🔧 Command line arguments
| Parameter     | Default   | Type      | Description                                                                                   |
|--------------|-----------|-----------|-----------------------------------------------------------------------------------------------|
| `--headless`   | `False`  | `boolean` | Runs the browser in headless mode. Requires the `--useragent` argument to be set.             |
| `--useragent`  | `None`   | `string`  | Specifies a custom User-Agent string for the browser. (No need to set if camoufox used)                                        |
| `--debug`      | `False`  | `boolean` | Enables or disables debug mode for additional logging and troubleshooting.                   |
| `--browser_type` | `chromium`  | `string` | Specify the browser type for the solver. Supported options: chromium, chrome, msedge, camoufox      |
| `--thread`     | `1`      | `integer` | Sets the number of browser threads to use in multi-threaded mode.                           |
| `--host`       | `127.0.0.1` | `string`  | Specifies the IP address the API solver runs on.                                            |
| `--port`       | `5000`   | `integer` | Sets the port the API solver listens on.                                                    |
| `--proxy`       | `False`   | `boolean` | Select a random proxy from proxies.txt for solving captchas                                                   |

---

### 🐳 Docker Image
#### Running the Container (API-first, no RDP)
Build and run the API container that starts automatically on port 5000 using Camoufox by default:

```sh
# Build
docker build -f Docker/Dockerfile.camoufox -t turnstile_solver:camoufox .

# Run
docker run -d --name turnstile_solver -p 5000:5000 turnstile_solver:camoufox
```

After the container starts, the API is available at `http://localhost:5000`.

#### Legacy Desktop/RDP Container (optional)
If you still want an RDP-enabled image:

```sh
docker build -f Docker/Dockerfile -t turnstile_solver:rdp .
docker run -d -p 3389:3389 -p 5000:5000 -e TZ=Asia/Baku --name turnstile_solver turnstile_solver:rdp
```

You can connect via RDP to `localhost:3389` (user `root`, pass `root`), but this is no longer required to start the API. The API starts automatically on port 5000 and defaults to Camoufox.

---

### 📡 API Documentation
#### Solve turnstile
```http
  GET /turnstile?url=https://example.com&sitekey=0x4AAAAAAA
```
#### Request Parameters:
| Parameter  | Type    | Description                                                                 | Required |
|------------|---------|-----------------------------------------------------------------------------|----------|
| `url`      | string  | The target URL containing the CAPTCHA. (e.g., `https://example.com`) | Yes      |
| `sitekey`  | string  | The site key for the CAPTCHA to be solved. (e.g., `0x4AAAAAAA`) | Yes      |
| `action`   | string  | Action to trigger during CAPTCHA solving, e.g., `login`            | No       |
| `cdata`    | string  | Custom data that can be used for additional CAPTCHA parameters.    | No       |

#### Response:

If the request is successfully received, the server will respond with a `task_id` for the CAPTCHA solving task:

```json
{
  "task_id": "d2cbb257-9c37-4f9c-9bc7-1eaee72d96a8"
}
```

#### Get Result
```http
  GET /result?id=f0dbe75b-fa76-41ad-89aa-4d3a392040af
```

#### Request Parameters:

| Parameter  | Type    | Description                                                                 | Required |
|------------|---------|-----------------------------------------------------------------------------|----------|
| `id`       | string  | The unique task ID returned from the `/turnstile` request.                   | Yes      |

#### Response:

If the CAPTCHA is solved successfully, the server will respond with the following information:

```json
{
  "elapsed_time": 7.625,
  "value": "0.KBtT-r"
}
```

---

### 🎉 Sponsor
<a href="https://dashboard.capsolver.com/passport/register?inviteCode=7_Dvkat0RVqc">
    <img src="https://github.com/user-attachments/assets/176d2a43-2d08-4aa6-bc9d-5e1eb5c3d1a4" alt="Description">
</a>

---

Inspired by [Turnaround](https://github.com/Body-Alhoha/turnaround)
Original code by [Theyka](https://github.com/Theyka/Turnstile-Solver)
Changes by [Sexfrance](https://github.com/sexfrance)

---

## Comprehensive Documentation

### Quickstart (Local)
- Install Python 3.9+
- Install dependencies and choose a browser (Camoufox recommended):
  ```bash
  pip install -r requirements.txt
  python -m camoufox fetch
  ```
- Start API locally:
  ```bash
  python api_solver.py --browser_type camoufox --host 0.0.0.0 --port 5000
  ```
- Test:
  ```bash
  curl 'http://localhost:5000/turnstile?url=https://example.com&sitekey=0x4AAAAAAA'
  ```

### Browser Options
- Default: Camoufox (no custom user-agent needed for headful/headless)
- Chromium/Chrome/Edge via Patchright:
  ```bash
  # Examples
  python -m patchright install chromium
  python -m patchright install msedge
  # Chrome on Debian/Ubuntu (if not using Patchright):
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  apt install -y ./google-chrome-stable_current_amd64.deb
  rm ./google-chrome-stable_current_amd64.deb
  ```
- Note: For non-Camoufox headless, a custom `--useragent` is required.

### API Reference
- GET `/turnstile`
  - Query params:
    - `url` (required)
    - `sitekey` (required)
    - `action` (optional)
    - `cdata` (optional)
  - Returns: `{ "task_id": "uuid" }` with 202 Accepted on queueing
- GET `/result`
  - Query params:
    - `id` (required, returned by `/turnstile`)
  - Returns: `{ "value": "<token>", "elapsed_time": <seconds> }` on success or HTTP 422 with `CAPTCHA_FAIL` value

Examples:
```bash
# Submit a task
curl 'http://localhost:5000/turnstile?url=https://example.com&sitekey=0x4AAAAAAA'

# Fetch result
curl 'http://localhost:5000/result?id=<task_id>'
```

### Configuration (CLI flags)
- `--headless` (bool, default False): Run browser headless. For Chromium/Chrome/Edge, a `--useragent` is required if headless.
- `--useragent` (str, default None): Custom user agent.
- `--debug` (bool, default False): Extra logging.
- `--browser_type` (str, default camoufox): One of `chromium`, `chrome`, `msedge`, `camoufox`.
- `--thread` (int, default 1): Number of concurrent browsers in the pool.
- `--proxy` (bool, default False): Enable proxy usage (read from `proxies.txt`).
- `--host` (str, default 127.0.0.1): Bind address.
- `--port` (int, default 5000): API port.

### Proxies
- Enable with `--proxy True` and provide `proxies.txt` in the working directory.
- Supported line formats (one per line):
  - `http://ip:port`
  - `socks5://ip:port`
  - `http:ip:port:username:password`
  - `socks5:ip:port:username:password`

### Running with Docker (GHCR)
Images are published to the GitHub Container Registry (GHCR) via CI.

- Pull images:
  ```bash
  docker pull ghcr.io/<owner>/<repo>:camoufox   # API-first (recommended)
  docker pull ghcr.io/<owner>/<repo>:latest     # Alias of camoufox
  docker pull ghcr.io/<owner>/<repo>:rdp        # Legacy RDP-enabled image
  ```

- Run API-first (Camoufox):
  ```bash
  docker run -d \
    --name turnstile_solver \
    -p 5000:5000 \
    -v $(pwd)/proxies.txt:/app/proxies.txt:ro \
    -v $(pwd)/results.json:/app/results.json \
    ghcr.io/<owner>/<repo>:camoufox
  ```
  - Starts API automatically on `0.0.0.0:5000`
  - Contains a virtual display (Xvfb) for GUI needs

- Run RDP image (optional):
  ```bash
  docker run -d \
    --name turnstile_solver_rdp \
    -p 3389:3389 -p 5000:5000 \
    -e TZ=UTC \
    -e RUN_API_SOLVER=true \
    -v $(pwd)/proxies.txt:/app/proxies.txt:ro \
    -v $(pwd)/results.json:/app/results.json \
    ghcr.io/<owner>/<repo>:rdp
  ```
  - RDP: connect to `localhost:3389` (user `root`, pass `root`)
  - API runs automatically via Xvfb; RDP is optional

- Override CLI args (both images):
  ```bash
  docker run -d -p 5000:5000 ghcr.io/<owner>/<repo>:camoufox \
    python api_solver.py --browser_type camoufox --host 0.0.0.0 --port 5000 --thread 2 --proxy True
  ```

### CI/CD (GitHub Actions → GHCR)
- On push to `main`/`master`, tags (`v*`, `release-*`), or manual dispatch:
  - Builds `Docker/Dockerfile.camoufox` (tags: `:camoufox`, `:latest`, `:camoufox-<sha>`)
  - Builds `Docker/Dockerfile` (tags: `:rdp`, `:rdp-<sha>`)
- Requires repository Actions workflow permission: “Read and write” to publish packages.

### Networking & Ports
- API listens on `:5000` in containers; expose/map with `-p 5000:5000`.
- RDP image also exposes `:3389` for desktop access (optional).

### Data & Persistence
- `results.json` stores completed tasks; map it as a volume for persistence.
- `proxies.txt` optional; map read-only if used.

### Troubleshooting
- Browser fails to launch:
  - Ensure Camoufox fetched: `python -m camoufox fetch`
  - In Docker, both images bundle Xvfb for GUI requirements.
- Headless with Chromium/Chrome/Edge errors:
  - Provide a `--useragent` or switch to Camoufox.
- API not reachable in Docker:
  - Confirm binding to `0.0.0.0` and port mapping `-p 5000:5000`.
- Proxy errors:
  - Verify `proxies.txt` format matches the documented formats.

---
