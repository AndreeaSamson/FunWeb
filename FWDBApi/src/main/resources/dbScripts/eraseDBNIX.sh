#!/bin/bash

sqlplus -s tw2017/TW2017 << EOF
whenever sqlerror  continue;
set echo off
set heading off

@drop_tables.sql

exit;
EOF