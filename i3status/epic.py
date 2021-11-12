#!/usr/bin/env python3
import os
from epicstore_api import EpicGamesStoreAPI, OfferData

api = EpicGamesStoreAPI()
free = api.get_free_games()
game_name = ''
dictionary = {}
epic_list = os.path.join( os.path.expanduser( '~' ), '.dotfiles/i3_infos/epic_list.txt' )

with open(epic_list) as file:
 for line in file:
 
    dictionary[line.strip()] = ''#value.strip()

for free_data in free['data']['Catalog']['searchStore']['elements']:
    if type(free_data['promotions']) is dict:
        if len(free_data['promotions']['promotionalOffers']) == 1:
            game_name = free_data['title']
            if game_name not in dictionary:
                print(game_name, end='')
                quit()

