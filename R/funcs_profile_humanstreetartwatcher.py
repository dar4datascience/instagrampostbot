# profile upload for humanstreetartwatcher
# enter the Python REPL, create a dictionary, and exit
#reticulate::repl_python()

import os
from instabot import Bot

test_file_name = 'temp_down_images/test_image.jpg'

# bot instatiate
bot = Bot()
bot.login(username='@humanstreetartwatcher', password=os.environ['hstw_pwd'])
#image = 'path 2 image to uplaad'
caption_string = '''Test Launch of Human Street Art Watcher: Leave Your Mark 🖤✖️
•••
#streetart #streetartcmdx #mexicostreetart #humanstreetartwatcher #mexicocityart #cdmxstickers #streetartandgraffiti #streetarteverywhere #artinthestreets #streetartgallery #streetartglobe #globalstreetart #stickers #stickerbombworld #stickerart #stickerslaps
'''

bot.upload_photo(test_file_name, 
                 caption = caption_string)



exit
