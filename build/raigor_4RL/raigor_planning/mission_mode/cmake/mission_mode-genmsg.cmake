# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mission_mode: 0 messages, 1 services")

set(MSG_I_FLAGS "")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mission_mode_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_custom_target(_mission_mode_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mission_mode" "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(mission_mode
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mission_mode
)

### Generating Module File
_generate_module_cpp(mission_mode
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mission_mode
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mission_mode_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mission_mode_generate_messages mission_mode_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_dependencies(mission_mode_generate_messages_cpp _mission_mode_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mission_mode_gencpp)
add_dependencies(mission_mode_gencpp mission_mode_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mission_mode_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(mission_mode
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mission_mode
)

### Generating Module File
_generate_module_eus(mission_mode
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mission_mode
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mission_mode_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mission_mode_generate_messages mission_mode_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_dependencies(mission_mode_generate_messages_eus _mission_mode_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mission_mode_geneus)
add_dependencies(mission_mode_geneus mission_mode_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mission_mode_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(mission_mode
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mission_mode
)

### Generating Module File
_generate_module_lisp(mission_mode
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mission_mode
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mission_mode_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mission_mode_generate_messages mission_mode_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_dependencies(mission_mode_generate_messages_lisp _mission_mode_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mission_mode_genlisp)
add_dependencies(mission_mode_genlisp mission_mode_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mission_mode_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(mission_mode
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mission_mode
)

### Generating Module File
_generate_module_nodejs(mission_mode
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mission_mode
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mission_mode_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mission_mode_generate_messages mission_mode_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_dependencies(mission_mode_generate_messages_nodejs _mission_mode_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mission_mode_gennodejs)
add_dependencies(mission_mode_gennodejs mission_mode_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mission_mode_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(mission_mode
  "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mission_mode
)

### Generating Module File
_generate_module_py(mission_mode
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mission_mode
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mission_mode_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mission_mode_generate_messages mission_mode_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ryan/raigor_ws/src/raigor_4RL/raigor_planning/mission_mode/srv/mode_switch.srv" NAME_WE)
add_dependencies(mission_mode_generate_messages_py _mission_mode_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mission_mode_genpy)
add_dependencies(mission_mode_genpy mission_mode_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mission_mode_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mission_mode)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mission_mode
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mission_mode)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mission_mode
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mission_mode)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mission_mode
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mission_mode)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mission_mode
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mission_mode)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mission_mode\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mission_mode
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
