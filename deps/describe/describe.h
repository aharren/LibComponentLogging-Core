
//
// describe.h
//
// Copyright (c) 2013 Stephen Mathieson
// MIT licensed
//


#ifndef DESCRIBE_H
#define DESCRIBE_H 1

#include "console-colors/console-colors.h"
#include "assertion-macros/assertion-macros.h"

#define DESCRIBE_VERSION "1.1.0"
#define DESCRIBE_OK      "✓"
#define DESCRIBE_FAIL    "✖"

/*
 * Describe `suite` with `title`
 */

#define describe(title, suite) int main(void) { \
  printf("\n  %s\n", title); \
  suite; \
  printf("\n"); \
  return assert_failures(); \
}

/*
 * Describe `fn` with `specification`
 */

#define it(specification, fn) ({     \
  int before = assert_failures();    \
  fn;                                \
  if (assert_failures() == before) { \
    cc_fprintf(                      \
        CC_FG_DARK_GREEN             \
      , stdout                       \
      , "    %s"                     \
      , DESCRIBE_OK                  \
    );                               \
  } else {                           \
    cc_fprintf(                      \
        CC_FG_DARK_RED               \
      , stdout                       \
      , "    %s"                     \
      , DESCRIBE_FAIL                \
    );                               \
  }                                  \
  cc_fprintf(                        \
      CC_FG_GRAY                     \
    , stdout                         \
    , " %s\n"                        \
    , specification                  \
  );                                 \
});

#endif
