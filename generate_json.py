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

dr = "./old-posts"  # sys.argv[1]

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

      # Grab the article
      article = soup.article

      # Get the title 
      all_results = soup.select('h2 > a')
      if all_results:
        results = [r.text for r in all_results]
        title = results[0].replace('"',"'")
        print("  Title: " + title)
        all_results[0].decompose( )

      # Remove the h2 tag that the title was in
      first_h2 = soup.select('h2:nth-child(1)')
      first_h2[0].decompose( )  
   
      # Get the posted date
      all_results = soup.select('div.postmeta > time')
      if all_results:
        results = [r.text for r in all_results]
        posted = results[0]
        print("  Posted: " + posted)
        utc_time = time.strptime(posted, "%B %d, %Y")
        pub_epoch = timegm(utc_time) * 1000
        print("    pub_epoch: " + str(pub_epoch))
      else:
        print("  WARNING: No publication date found!  pub_epoch: " + str(pub_epoch))  

      # Remove the div.postmeta that the posted date was in
      all_results = soup.select('div.postmeta')
      if all_results:
        all_results[0].decompose( )  

      # Print the remaining article
      article_string = str(article).replace('\n', '').replace('"', "'")
      # print(article_string)  

      fp.close( )

      # Temporary debugging
      # article_string = "<article>This is debug info</article>"

      # Read the post template into a string and substitute details into it
      # Append the string representation to `posts_as_string`
      with open("minimal-post-template.json", "r") as tf:
        t_str = tf.read( )
        t_obj = Template(t_str)
        post_string = t_obj.substitute(id=count, title=title, html_goes_here=article_string, pub_epoch=pub_epoch)
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
json = open("exports.json", "w")
json.write(import_string)

