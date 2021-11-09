#!/usr/bin/env python3
from epicstore_api import EpicGamesStoreAPI, OfferData

api = EpicGamesStoreAPI()
free = api.get_free_games()
game_name = ''
dictionary = {}

with open("/home/fgilles/.dotfiles/i3status/epic_list.txt") as file:
 for line in file:
 
    dictionary[line.strip()] = ''#value.strip()

for free_data in free['data']['Catalog']['searchStore']['elements']:
    if type(free_data['promotions']) is dict:
        if len(free_data['promotions']['promotionalOffers']) == 1:
            game_name = free_data['title']
            if game_name not in dictionary:
                print(game_name, end='')
                quit()

