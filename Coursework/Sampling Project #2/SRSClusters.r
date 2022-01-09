#SRS of clusters - 5' wide 
#Length of northernmost side of plot
Length = 865

#Population of Clusters with width 5. 
N <- Length/5
n <- 6

#Setting seed and applying srs to assign clusters.
set.seed(102221); samp <- sample(N, n, replace = F)
samp_assigned <- matrix(samp, nrow = 3, byrow = T, 
                        dimnames = list(c("Stefano", "Thomas", "Bria"), 
                                        c("samp1", "samp2")))
> samp_assigned  
#        samp1 samp2
#Stefano   107   158
#Thomas    145    91
#Bria       19   130

#Computing the location of samples 
samp_assigned * 5 - 2.5

#        samp1 samp2
#Stefano 532.5 787.5
#Thomas  722.5 452.5
#Bria     92.5 647.5