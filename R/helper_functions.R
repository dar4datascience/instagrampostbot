# Functions needed to process
# 0. Set up
# renv::install(c('pacman', 'googledrive', 'reticulate', 'dplyr', 'fs', 'here'))
# 1. list available images from drive image foler
# Reqs Auth
googledrive::drive_auth(email = 'danielamieva@dar4datascience.com')
# 2. pull excel data with parameters for post workflow
# 3. Filter image 2 post 
# 4. Instantiate new bot
# 5. Post image
# 6. Render report of action
# 7. Log already posted images
# 8. Move image 2 posted folder


list_of_images <- googledrive::drive_ls(
  'https://drive.google.com/drive/folders/10_8722NHADSIfN7EIk5darMKE9KHnhvL'
)
  
  
available_folders <- googledrive::drive_ls(
  'https://drive.google.com/drive/folders/1jghDATrsqKuut8K-G_xc0c5fJouBkjSW'
)

# enter the Python REPL, create a dictionary, and exit
repl_python()
dictionary = {'alpha': 1, 'beta': 2}
exit

# access the created dictionary from R
py$dictionary