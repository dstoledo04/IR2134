cmake_minimum_required(VERSION 3.8)
project(first_project)

find_package(ament_cmake REQUIRED)

# Instala tus fuentes (YAML+PNG+launch)
install(DIRECTORY launch maps config
  DESTINATION share/${PROJECT_NAME}
)

# --- Generación automática del mundo Gazebo y assets ---
# Rutas
set(map_path ${CMAKE_CURRENT_SOURCE_DIR}/maps/first/first.building.yaml)

# Donde se generará en build/
set(output_dir ${CMAKE_CURRENT_BINARY_DIR}/maps/first_ign)
set(output_world_path ${output_dir}/first.world)
set(output_model_dir ${output_dir}/models)

# (opcional) cache de modelos Fuel
add_custom_target(
  update_model_cache
  COMMAND ros2 run rmf_building_map_tools building_map_model_downloader
)

# Genera world + descarga modelos a output_model_dir
add_custom_command(
  OUTPUT ${output_world_path}
  COMMAND ros2 run rmf_building_map_tools building_map_generator gazebo
          ${map_path} ${output_world_path} ${output_model_dir}
  DEPENDS ${map_path}
)

add_custom_target(generate_first_world ALL
  DEPENDS ${output_world_path}
)

add_dependencies(generate_first_world update_model_cache)

# Instala lo generado
install(
  DIRECTORY ${output_dir}
  DESTINATION share/${PROJECT_NAME}/maps
)
# -----------------------------------------------

ament_package()
