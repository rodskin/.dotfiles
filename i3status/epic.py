#!/usr/bin/env python3
from epicstore_api import EpicGamesStoreAPI, OfferData

api = EpicGamesStoreAPI()
free = api.get_free_games()
game_name = ''
for free_data in free['data']['Catalog']['searchStore']['elements']:
    if type(free_data['promotions']) is dict:
        if len(free_data['promotions']['promotionalOffers']) == 1:
            game_name = free_data['title']
print(game_name, end='')

