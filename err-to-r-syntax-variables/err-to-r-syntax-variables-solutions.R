# Assign your first name to a variable called user_first_name
user_first_name <- 'Ewan'
# Assign your last name to a variable called user_last_name
user_last_name <- 'McNabb'
# If you have a middle name assign it to a variable called user_middle_name, otherwise assign ''
user_middle_name <- ''
# Assign you age to a variable called user_age
user_age <- '100'
# View the variables to check they are assigned properly. If not reassign them
print(user_first_name)
print(user_last_name)
print(user_middle_name)
print(user_age)
# Create a vector called user_info containing the variables above
user_info <- c(user_first_name,user_middle_name,user_last_name,user_age)
# Remove all variables except user_info
rm(user_first_name)
rm(user_last_name)
rm(user_middle_name)
rm(user_age)
# Check to ensure they have been removed from the environment
ls() #Could also use the window in R Studio
# Using the concatenate function append and update your current location to user_info
user_info <- c(user_info,'Somewhere')
# Change the element representing age within user_info to the year you were born.
# Slightly tricky as it was briefly covered in the post.
print(user_info) # It is at element 4
user_info[4] <- '1917'
# Check that it has updated
user_info
