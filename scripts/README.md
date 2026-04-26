# Scripts

These scripts are starter scaffolds. Read before running.

- `lab_status_check.sh`: simple health check summary.
- `capture_known_good_state.sh`: writes a redacted state snapshot.
- `check_ollama.sh`: tests local model server basics for Ollama or llama.cpp-compatible endpoints.
- `build_wiki.sh`: builds the MkDocs wiki site into `site/`.
- `make_static_dashboard.py`: updates a static dashboard JSON/HTML copy.
- `check_digital_factory_placeholder.py`: placeholder for future Digital Factory API check.

The wiki build helper expects `mkdocs` and the Material theme to be installed in the current environment.
If they are missing, install them with `python3 -m pip install -r requirements-wiki.txt`.
