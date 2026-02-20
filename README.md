
Primeramente para abrir el docker rocker ghcr.io/open-rmf/rmf/rmf_demos:jazzy-rmf-latest --x11   --volume ~/Documentos/GitHub/IR2134/rmf_ws:/ws

Para lanzar mi first_project ejecutamos ros2 launch firs_project first.launch.xml y para mandar una tarea he utilizado ros2 run project_tasks dispatch_patrol   --use_sim_time   -p tinyRobot1_charger piso2   -n 1   -F tinyRobot1   -R tinyRobot1

Para lanzar el mapa de kyoto utilizamos rocker --x11 --name rmf_demos \
  -e ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST \
  --network host \
  ghcr.io/open-rmf/rmf/rmf_demos:jazzy-rmf-latest \
  ros2 launch kioto kioto.launch.xml \
  server_uri:="ws://localhost:8000/_internal"
docker run --network host --rm -it \
  -e ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST \
  -e RMW_IMPLEMENTATION=rmw_cyclonedds_cpp \
  ghcr.io/open-rmf/rmf-web/api-server:jazzy-nightly
docker run --network host --rm -it \
  -e RMF_SERVER_URL=http://localhost:8000 \
  -e TRAJECTORY_SERVER_URL=ws://localhost:8006 \
  ghcr.io/open-rmf/rmf-web/demo-dashboard:jazzy-nightly
o utilizamos ros2 launch kioto kioto.launch.xml
-------------------------------------------------------------------
LARGE_PROJECT
Primeramente para abrir el docker rocker ghcr.io/open-rmf/rmf/rmf_demos:jazzy-rmf-latest --x11   --volume ~/Documentos/GitHub/IR2134/rmf_ws:/ws
Para lanzar mi estce ejecutamos ros2 launch large_project estce.launch.xml y para mandar una tarea he utilizado ros2 run project_tasks dispatch_patrol   --use_sim_time   -p tinyRobot1_charger rotonda   -n 1   -F TinyRobot   -R tinyRobot1
ros2 run project_tasks dispatch_delivery --use_sim_time -p pickup -d dropoff -i Coke -n 1 -F TinyRobot -R tinyRobot2
ros2 run project_tasks dispatch_clean --use_sim_time -z cleanin -n 1 -F CleanerBotA -R CleanerBotA
