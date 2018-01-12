# -*- coding: utf-8 -*-
"""
Created on Thu Jan 11 11:36:19 2018

@author: Kyle
"""

import json
import csv

# Load in the conflict JSON data
with open('conflict_data.json') as file:
    data = json.load(file)

for thing in data:
    thing.pop('id')
    thing.pop('number_of_sources')
    thing.pop('source_article')
    thing.pop('source_office')
    thing.pop('source_date')
    thing.pop('source_headline')
    thing.pop('source_original')
    thing.pop('active_year')
    thing.pop('code_status')
    thing.pop('dyad_dset_id')
    thing.pop('adm_1')
    thing.pop('adm_2')
    thing.pop('side_a_dset_id')
    thing.pop('side_b_dset_id')
    thing.pop('where_description')
    thing.pop('geom_wkt')
    thing.pop('priogrid_gid')
    thing.pop('conflict_dset_id')
    thing.pop('dyad_new_id')
    thing.pop('conflict_new_id')
    thing.pop('where_coordinates')


# Open the output CSV file we want to write to
with open('conflict.csv', 'w', newline='') as file:
    csvwriter = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    csvwriter.writerow(['id', 'year', 'type of violence', 'conflict name', 'dyad name', 'side A ID', 'side A', 'side B ID', 'side B', 'location clarity', 'latitude', 'longitude', 'country', 'country ID', 'region', 'event clarity', 'date clarity', 'start date', 'end date', 'side A deaths', 'side B deaths', 'civilian deaths', 'unknown deaths', 'best guess deaths', 'highest estimate deaths', 'lowest estimates deaths'])   
    for lis in range(len(data)):
        # [x.encode('utf-8') for x in items]
        csvwriter.writerow(data[lis].values())
    # Actually write the data to the CSV file here.
    # You can use the same csvwriter.writerow command to output the data 
    #   as is used above to output the headers.

    