#!/usr/bin/env python3
from epicstore_api import EpicGamesStoreAPI, OfferData
import dateparser

api = EpicGamesStoreAPI()
free = api.get_free_games()
for free_data in free['data']['Catalog']['searchStore']['elements']:
    if type(free_data['promotions']) is dict:
        if len(free_data['promotions']['promotionalOffers']) == 1:
            date_debut = dateparser.parse(free_data['promotions']['promotionalOffers'][0]['promotionalOffers'][0]['startDate']).date()
            date_fin = dateparser.parse(free_data['promotions']['promotionalOffers'][0]['promotionalOffers'][0]['endDate']).date()
        else:
            date_debut = dateparser.parse(free_data['promotions']['upcomingPromotionalOffers'][0]['promotionalOffers'][0]['startDate']).date()
            date_fin = dateparser.parse(free_data['promotions']['upcomingPromotionalOffers'][0]['promotionalOffers'][0]['endDate']).date()
        print(free_data['title'], ': du ', date_debut, ' au ', date_fin)
        print('\n')
