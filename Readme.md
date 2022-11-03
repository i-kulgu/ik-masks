# Usable masks as items

Easy configurable masks script with his own shop.

- Built-in Masks Shop
- Add masks easily from config, they will be created as shop items and usable items automatically
- Ability to set is as a gang mask, then only the players with gang perm will see them

( For any help you can reach us at Discord: [Hi-Dev](https://discord.com/invite/pSJPPctrNx) )

# Installation

- Add the following items in your qb-core\shared\items.lua

```lua
    -- IK-MASKS
    ['hockeymask']                      = {['name'] = 'hockeymask',                     ['label'] = 'Hockey Mask',              ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskhockey.png',               ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['blackbandana']                    = {['name'] = 'blackbandana',                   ['label'] = 'Black Bandana',            ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskblackbandana.png',         ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['tshirtmask']                      = {['name'] = 'tshirtmask',                     ['label'] = 'Tshirt Mask',              ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'masktshirt.png',               ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['scarecrowmask']                   = {['name'] = 'scarecrowmask',                  ['label'] = 'Scarecrow Mask',           ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskscarecrow.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['monkeymask']                      = {['name'] = 'monkeymask',                     ['label'] = 'Monkey Mask',              ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskmonkey.png',               ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['pigmask']                         = {['name'] = 'pigmask',                        ['label'] = 'Pig Mask',                 ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskpig.png',                  ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['longnose']                        = {['name'] = 'longnose',                       ['label'] = 'Long Nose',                ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'masklongnose.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['bluemask']                        = {['name'] = 'bluemask', 				        ['label'] = 'Blue Mask',                ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskblue.png',                 ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['silvermask']                      = {['name'] = 'silvermask',                     ['label'] = 'Silver Mask',              ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'masksilver.png',               ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['goldmask']                        = {['name'] = 'goldmask',                       ['label'] = 'Please Gold Mask',         ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskgold.png',                 ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['bagmask']                         = {['name'] = 'bagmask',                        ['label'] = 'Bag Mask',                 ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskbag.png',                  ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['greenmask']                       = {['name'] = 'greenmask',                      ['label'] = 'Green Mask',               ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskgreen.png',                ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['balaclava']                       = {['name'] = 'balaclava',                      ['label'] = 'Balaclava',                ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskbalaclava.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['balaclava2']                      = {['name'] = 'balaclava2',                     ['label'] = 'Balaclava 2',              ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskbalaclava2.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['chinesemask']                     = {['name'] = 'chinesemask',                    ['label'] = 'Chinese Mask',             ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskchinese.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['clownmask']                       = {['name'] = 'clownmask',                      ['label'] = 'Clown Mask',               ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskclown.png',                ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['gorillamask']                     = {['name'] = 'gorillamask',                    ['label'] = 'Gorilla Mask',             ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskgorilla.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['horsemask']                       = {['name'] = 'horsemask',                      ['label'] = 'Horse Mask',               ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskhorse.png',                ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['unicornmask']                     = {['name'] = 'unicornmask',                    ['label'] = 'Unicorn Mask',             ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskunicorn.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['skullmask']                       = {['name'] = 'skullmask',                      ['label'] = 'Skull Mask',               ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskskull.png',                ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['facemask']                        = {['name'] = 'facemask',                       ['label'] = 'Face Mask',                ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskface.png',                 ['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},
    ['sockmask']                        = {['name'] = 'sockmask',                       ['label'] = 'Red Sock Mask',            ['weight'] = 1,  		['type'] = 'item',  	['image'] = 'maskredsock.png',  			['unique'] = true,  	['useable'] = true,  	['shouldClose'] = true,  	['combinable'] = nil, 	['description'] = ''},

```

- Copy the images from images folder to xx-inventory\html\images
- Restart the server

# Add new mask

- Add a new mask item in your qb-core\shared\items.lua file
- Go to config.lua and add the newly created item new mask like:

["maskname"]          ={ variation = 123, palette = 0, price = 450, gang = true},


    - Variation is the clothing number in masks
    - Palette is the texture number
    - Price is the price for selling the item in the shop
    - Gang is the boolean to show the mask in the shop only for gangs

- Restart the server (items.lua changed) and the mask will work
