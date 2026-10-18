#!/usr/bin/env bash
set -euo pipefail

KUBESPRAY_VERSION="v2.32.0"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
KUBESPRAY_DIR="${PROJECT_DIR}/kubespray"
VENV_DIR="${PROJECT_DIR}/kubespray-venv"

if [ ! -d "${KUBESPRAY_DIR}" ]; then
  git clone --branch "${KUBESPRAY_VERSION}" \
    https://github.com/kubernetes-sigs/kubespray.git \
    "${KUBESPRAY_DIR}"
fi

python3 -m venv "${VENV_DIR}"
source "${VENV_DIR}/bin/activate"

pip install --upgrade pip
pip install -r "${KUBESPRAY_DIR}/requirements.txt"

echo "Kubespray ${KUBESPRAY_VERSION} prepared."
echo
echo "Run cluster deployment using the project inventory:"
echo
echo "cd ${KUBESPRAY_DIR}"
echo "ANSIBLE_CONFIG=inventory/project-two/ansible.cfg ansible-playbook \\"
echo "  -i inventory/project-two/hosts.yaml cluster.yml \\"
echo "  -u neachanja_gmail_com \\"
echo "  --private-key=/home/meneakev/.ssh/google_compute_engine \\"
echo "  -b --become-user=root"
