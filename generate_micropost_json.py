#!/usr/bin/env python3

# generate_json.py
# This script reads each .html file to construct a single exports.json file suitable for import to Ghost

import shutil
import os
import sys
import time
import html
from calendar import timegm
from bs4 import BeautifulSoup
from string import Template

dr = "./old-microposts"  
# dr = sys.argv[1]

count = 0
posts_as_string = ""

epoch_time = str(int(time.time( )))
pub_epoch = epoch_time

# Loop on all the .html files to build the `posts` array of json
for root, dirs, files in os.walk(dr):
  for f in files:
    print("Processing: " + f)
    path = dr + "/" + f
    with open(path) as fp:
      soup = BeautifulSoup(fp, features="html.parser")
      
      # Remove the <head>, <header> and <footer> tags
      soup.find('head').decompose( )  
      soup.find('header').decompose( )  
      soup.find('footer').decompose( )  

      # Get the location string
      all_results = soup.select('section.content-body > span:nth-child(2) > b')
      if all_results:
        results = [r.text for r in all_results]
        location = results[0].replace('"',"'")
        print("  Location: " + location)
        all_results[0].decompose( )

      # Get the posted data string
      all_results = soup.select('section.content-body > span > b')
      if all_results:
        results = [r.text for r in all_results]
        posted = results[0].replace('"',"'")
        print("  Posted: " + posted)
        utc_time = time.strptime(posted, "%A, %B %d, %Y · %I:%M %p")
        pub_epoch = timegm(utc_time) * 1000
        print("    pub_epoch: " + str(pub_epoch))
        all_results[0].decompose( )
      else:
        print("  WARNING: No publication date found!  pub_epoch: " + str(pub_epoch))  

      # Get the micropost body
      all_results = soup.select('section.content-body')
      if all_results:
        results = [r.text for r in all_results]
        body = results[0].replace('"',"'").replace("\n","").replace("Posted:  Location: ","")
        print("  Body: " + body)

      #   utc_time = time.strptime(posted, "%B %d, %Y")
      #   pub_epoch = timegm(utc_time) * 1000
      #   print("    pub_epoch: " + str(pub_epoch))
      # else:
      #   print("  WARNING: No publication date found!  pub_epoch: " + str(pub_epoch))  

      fp.close( )

      # Read the post template into a string and substitute details into it
      # Append the string representation to `posts_as_string`
      with open("minimal-micropost-template.json", "r") as tf:
        t_str = tf.read( )
        t_obj = Template(t_str)
        post_string = t_obj.substitute(id=count, title=f, html_goes_here=body, pub_epoch=pub_epoch, location=location)
        # print(post_string)
        posts_as_string += post_string + ",\n"

      # Increment the post count
      count += 1

# String the final comma from posts_as_string
pas = posts_as_string.rstrip(",\n")

# Read the import template into a string and substitute details into it
with open("minimal-ghost-import-template.json", "r") as tf:
  t_str = tf.read( )
  t_obj = Template(t_str)
  import_string = t_obj.substitute(epoch=epoch_time, post_data=pas)
  # print(import_string)

# Open the exports.json file and write the import structure
json = open("micro-exports.json", "w")
json.write(import_string)

