cmake_minimum_required(VERSION 3.8)
project(onbot_description)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(controller_manager REQUIRED)
find_package(gazebo_ros REQUIRED)
find_package(rclcpp REQUIRED)
find_package(ros_gz REQUIRED)
find_package(ros_gz_bridge REQUIRED)
find_package(ros_gz_sim REQUIRED)
find_package(ros_gz_image REQUIRED)
find_package(trajectory_msgs REQUIRED)
find_package(xacro REQUIRED)

# # Define the command to download the resource using wget
# set(ONSHAPE_TO_ROBOT_COMMAND  "onshape-to-robot" "${CMAKE_CURRENT_SOURCE_DIR}/model/.")

# # Execute the download command during the build process
# execute_process(
#     COMMAND ${ONSHAPE_TO_ROBOT_COMMAND}
# )

install(
  DIRECTORY model launch config hooks worlds
  DESTINATION share/${PROJECT_NAME}
)




ament_environment_hooks("${CMAKE_CURRENT_SOURCE_DIR}/hooks/${PROJECT_NAME}.dsv.in")


if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
