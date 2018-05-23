# September 2016, Emeline Favreau
# aim: randomise the locations of up to 96 samples on a PCR plate
# inputs: path to csv file with names of samples, name of output file
# output: a csv file with a PCR table filled with sample names in a randomised manner

# make generator function
generator <- function(sample_list_path, output_name){
  # input the samples from csv into a vector
  my_list_of_sample_names <- read.csv(sample_list_path, header = FALSE)$V1
  sample_names <- as.character(my_list_of_sample_names)

  # randomise your samples
  random_vec <- sample(sample_names,length(sample_names))

  # make up the 96 vector length
  if(length(random_vec) <= 96){
  random_vec <- append(random_vec,rep(NA, c(96-length(random_vec))))
  }

  # make a matrix for pcr
  pcr_mat <-  matrix(random_vec, nrow = 8, ncol = 12)
  rownames(pcr_mat) <- LETTERS[1:8]
  colnames(pcr_mat) <- 1:12

  # create name of output
  name_of_output <- paste(output_name, ".csv", sep = "")
  # export results
  write.csv(pcr_mat, file = name_of_output)
}

# use the function
generator(sample_list_path = "~/my_list_of_sample_names.csv", output_name = "test2")
