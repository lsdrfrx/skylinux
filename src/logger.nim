import logging
import constants

proc loggerInit*() {.noreturn.} =
  addHandler newConsoleLogger(fmtStr=logFmtStr)
  addHandler newFileLogger(logPath, fmtStr=logFmtStr)
  addHandler newFileLogger(errLogPath, fmtStr=logFmtStr, levelThreshold=lvlError)
