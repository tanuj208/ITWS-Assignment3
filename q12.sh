#!/bin/bash
read date
echo `date -d "$date" +%m/%d/%Y`
echo `date -d "$date" +%d-%m-%Y`
