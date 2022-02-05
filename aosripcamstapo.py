#!/usr/bin/env python3
import sys
from pytapo import Tapo

arg = sys.argv[1]
 
user = ""
password = ""
host = ""
tapo = Tapo(host, user, password)
tapo.setDayNightMode(arg)
