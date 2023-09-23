# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "raigor_general_perception: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iraigor_general_perception:/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg;-Istd_msgs:/home/ryan/catkin_ws/devel/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(raigor_general_perception_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_custom_target(_raigor_general_perception_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "raigor_general_perception" "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(raigor_general_perception
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/raigor_general_perception
)

### Generating Services

### Generating Module File
_generate_module_cpp(raigor_general_perception
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/raigor_general_perception
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(raigor_general_perception_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(raigor_general_perception_generate_messages raigor_general_perception_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_dependencies(raigor_general_perception_generate_messages_cpp _raigor_general_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(raigor_general_perception_gencpp)
add_dependencies(raigor_general_perception_gencpp raigor_general_perception_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS raigor_general_perception_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(raigor_general_perception
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/raigor_general_perception
)

### Generating Services

### Generating Module File
_generate_module_eus(raigor_general_perception
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/raigor_general_perception
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(raigor_general_perception_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(raigor_general_perception_generate_messages raigor_general_perception_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_dependencies(raigor_general_perception_generate_messages_eus _raigor_general_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(raigor_general_perception_geneus)
add_dependencies(raigor_general_perception_geneus raigor_general_perception_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS raigor_general_perception_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(raigor_general_perception
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/raigor_general_perception
)

### Generating Services

### Generating Module File
_generate_module_lisp(raigor_general_perception
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/raigor_general_perception
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(raigor_general_perception_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(raigor_general_perception_generate_messages raigor_general_perception_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_dependencies(raigor_general_perception_generate_messages_lisp _raigor_general_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(raigor_general_perception_genlisp)
add_dependencies(raigor_general_perception_genlisp raigor_general_perception_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS raigor_general_perception_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(raigor_general_perception
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/raigor_general_perception
)

### Generating Services

### Generating Module File
_generate_module_nodejs(raigor_general_perception
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/raigor_general_perception
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(raigor_general_perception_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(raigor_general_perception_generate_messages raigor_general_perception_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_dependencies(raigor_general_perception_generate_messages_nodejs _raigor_general_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(raigor_general_perception_gennodejs)
add_dependencies(raigor_general_perception_gennodejs raigor_general_perception_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS raigor_general_perception_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(raigor_general_perception
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/raigor_general_perception
)

### Generating Services

### Generating Module File
_generate_module_py(raigor_general_perception
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/raigor_general_perception
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(raigor_general_perception_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(raigor_general_perception_generate_messages raigor_general_perception_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_perception/raigor_general_perception/msg/obj_visual_pose.msg" NAME_WE)
add_dependencies(raigor_general_perception_generate_messages_py _raigor_general_perception_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(raigor_general_perception_genpy)
add_dependencies(raigor_general_perception_genpy raigor_general_perception_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS raigor_general_perception_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/raigor_general_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/raigor_general_perception
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(raigor_general_perception_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/raigor_general_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/raigor_general_perception
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(raigor_general_perception_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/raigor_general_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/raigor_general_perception
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(raigor_general_perception_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/raigor_general_perception)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/raigor_general_perception
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(raigor_general_perception_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/raigor_general_perception)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/raigor_general_perception\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/raigor_general_perception
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(raigor_general_perception_generate_messages_py std_msgs_generate_messages_py)
endif()
