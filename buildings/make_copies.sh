 #!/usr/bin/env bash
set -euo pipefail

BASE_DIR="/rmf_demos_ws/buildings/models"
# Define aquí cuántas copias quieres de cada uno
ADJ_FROM=1
ADJ_TO=74

CHAIR_FROM=1
CHAIR_TO=150

make_one() {
  local base="$1"   # AdjTable o OfficeChairGrey
  local idx="$2"    # 001, 002...
  local dst="${BASE_DIR}/${base}_${idx}"
  local src="${BASE_DIR}/${base}"

  if [[ ! -d "$src" ]]; then
    echo "ERROR: No existe el modelo base: $src" >&2
    exit 1
  fi

  mkdir -p "$dst"

  # Copia los ficheros “ligeros”
  cp -f "$src/model.config" "$dst/model.config"
  # El SDF puede llamarse model.sdf o algo dentro (ajusta si aplica)
  if [[ -f "$src/model.sdf" ]]; then
    cp -f "$src/model.sdf" "$dst/model.sdf"
  else
    # si no existe, intenta copiar el primer sdf que haya
    local any_sdf
    any_sdf="$(find "$src" -maxdepth 1 -type f -name "*.sdf" | head -n1 || true)"
    if [[ -n "${any_sdf}" ]]; then
      cp -f "$any_sdf" "$dst/$(basename "$any_sdf")"
    fi
  fi

  # Symlinks a carpetas pesadas si existen
  for d in meshes materials textures media; do
    if [[ -d "$src/$d" ]]; then
      ln -sfn "../$base/$d" "$dst/$d"
    fi
  done

  # Cambia el nombre en model.config
  # (típico: <name>AdjTable</name>)
  sed -i "s|<name>${base}</name>|<name>${base}_${idx}</name>|g" "$dst/model.config"

  # Cambia el nombre en el SDF si procede (a veces hay <model name="AdjTable">)
  if [[ -f "$dst/model.sdf" ]]; then
    sed -i "s|<model name=\"${base}\">|<model name=\"${base}_${idx}\">|g" "$dst/model.sdf"
    sed -i "s|<name>${base}</name>|<name>${base}_${idx}</name>|g" "$dst/model.sdf"
  fi

  echo "OK: $dst"
}

pad3() { printf "%03d" "$1"; }

# AdjTable_001..AdjTable_074
for i in $(seq "$ADJ_FROM" "$ADJ_TO"); do
  make_one "AdjTable" "$(pad3 "$i")"
done

# OfficeChairGrey_001..OfficeChairGrey_150
for i in $(seq "$CHAIR_FROM" "$CHAIR_TO"); do
  make_one "OfficeChairGrey" "$(pad3 "$i")"
done

