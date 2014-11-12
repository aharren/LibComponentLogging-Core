

#define _lcl_logger(_component, _level, _format, ...) {                        \
    sprintf(buf, "%s %s: " _format "",                                    \
          _lcl_level_header_1[_level],                                         \
          _lcl_component_header[_component],                                   \
          ## __VA_ARGS__);                                                     \
}
