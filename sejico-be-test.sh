#!/bin/bash
DIR="~/CCT/sejico-api"
clear
echo "Sejico checks"
# Stop on first error https://stackoverflow.com/a/3474556
set -e
echo "1. Flake8"
cd ${DIR}/backend
poetry run flake8 apps
echo "2. MyPy"
cd ${DIR}/backend
poetry run mypy apps --config-file mypy.ini
echo "3. Pytest"
cd ${DIR}
source bin/env.sh
# dctest run django pytest -x --cov apps --cov-report html:htmlcov  --config-file backend/pytest.ini
dctest run django pytest -x apps
