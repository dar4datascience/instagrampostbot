# Functions needed to process
library(dplyr)
# 0. Set up
# renv::install(c('pacman', 'googledrive', 'reticulate', 'dplyr', 'fs', 'here'))
# 1. list available images from drive image foler
# Reqs Auth
googledrive::drive_auth(email = 'danielamieva@dar4datascience.com')
# 2. pull excel data with parameters for post workflow
googlesheets4::gs4_auth(email = 'danielamieva@dar4datascience.com')
# 3. Filter image 2 post 
# 4. Instantiate new bot
# 5. Post image
# 6. Render report of action
# 7. Log already posted images
# 8. Move image 2 posted folder

# List available resources
list_of_images <- googledrive::drive_ls(
  'https://drive.google.com/drive/folders/10_8722NHADSIfN7EIk5darMKE9KHnhvL'
)
  
  
available_folders <- googledrive::drive_ls(
  'https://drive.google.com/drive/folders/1jghDATrsqKuut8K-G_xc0c5fJouBkjSW'
)

#this returns a folder> posted. which is good for now. cause we need not to see whats inside
full_list_of_images <- googledrive::drive_ls(
  #'Stickers Photo Staged',
  'https://drive.google.com/drive/folders/1jghDATrsqKuut8K-G_xc0c5fJouBkjSW',
  recursive = TRUE,
  pattern = '*.jpg'
) %>% 
  filter(stringr::str_detect(name, '\\w*.jpg'))


df_raw_data_2_drive <- full_list_of_images %>% 
  select(name) %>% 
  #distinct() %>% 
  rename('image name' = name)

# function to move a file
#?googledrive::drive_mv

# write into sheet list of available files in jpg to raw data from drive
#capted reference of file to 1k into instapictures sheets
googlesheets4::write_sheet(df_raw_data_2_drive,
                           'https://docs.google.com/spreadsheets/d/1lKPxm5an1pi7lmwtE-Jur4PehFMiy4f29AfYAqjU2gk/edit#gid=0',
                           sheet = 'Raw data from drive'
                           )

## check it out
raw_data_2_sheets <- googlesheets4::read_sheet(
  'https://docs.google.com/spreadsheets/d/1lKPxm5an1pi7lmwtE-Jur4PehFMiy4f29AfYAqjU2gk/edit#gid=0',
  sheet = 'Raw data from drive'
)

# Fetch spreadsheet data from instagram staged 
instapybot_resource_admin <- googlesheets4::read_sheet(
  'https://docs.google.com/spreadsheets/d/1lKPxm5an1pi7lmwtE-Jur4PehFMiy4f29AfYAqjU2gk/edit#gid=0',
  sheet = 'IntaPictureAdmin'
)



# test
# select image to upload
full_list_of_images %>% 
  filter(name == 'IMG_20220731_141432.jpg') %>% 
  pull(id) %>% 
  googledrive::drive_download(
    file = googledrive::as_id(.),
    path = 'temp_down_images/test_image.jpg'
  )

# we need to reshape images to fit instagram aspect ratio use magick
# image_2_trans <- magick::image_read('temp_down_images/test_image.jpg')
# magick::image_background(image_2_trans, "hotpink")
# magick::image_crop(image_2_trans, "1080x1350+80+10")
# image_2_trans_scaled <- magick::image_resize(image_2_trans, "480x600") #resize proportionally to height:
# magick::image_write(image_2_trans_scaled,
#                     'temp_down_images/test_image_480x600.jpg')
## consider throwing distinct to image file names

# enter python state
reticulate::repl_python()
# access the created dictionary from R
reticulate::py$dictionary

dictionary = {'alpha': 1, 'beta': 2}
exit