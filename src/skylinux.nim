import os
import strformat

import logger
import config

# Logger setup
loggerInit()

proc getMods(): seq[string] =
  @[]

proc runGame(config: Config, withModes: bool = true) {.noreturn.} =
  discard execShellCmd(fmt"cd {config.gamePath} && wine skse_loader.exe")

var cfg = getConfig()
