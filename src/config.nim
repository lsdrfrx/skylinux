import os
import parsecfg
import logging

import constants

type Config* = object
  gamePath*: string
  winePrefixPath*: string
  modsPath*: string
  modLoadOrderPath*: string

proc createConfigFile(): Config =
  info("config file does not exists. Creating a new one")

  var dict = newConfig()
  result = Config()
  
  stdout.write("Enter game path: ")
  let gamePath = stdin.readLine()

  stdout.write("Enter .wine prefix path: ")
  let winePrefixPath = stdin.readLine()

  result.gamePath = gamePath
  result.winePrefixPath = winePrefixPath
  
  dict.setSectionKey("General", "game_path", gamePath)
  dict.setSectionKey("General", "wine_prefix_path", winePrefixPath)

  dict.writeConfig(cfgPath)

proc loadConfigFile(): Config =
  let dict = loadConfig(cfgPath)
  result.gamePath = dict.getSectionValue("General", "game_path")
  result.winePrefixPath = dict.getSectionValue("General", "wine_prefix_path")

proc getConfig*(): Config =
  if not fileExists(cfgPath): createConfigFile() else: loadConfigFile()
