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

#Reading data
tau_i <- c(0, 3, 2, 0, 0, 1)
not_birch <- c(10, 16, 15, 7, 14, 5)
M_i <- tau_i + not_birch

#Computing Estimate
p_est = sum(tau_i)/sum(M_i)

#p_est
#[1] 0.08219178

#Computing SE
expected = p_est*M_i
mse = sum((tau_i - expected)^2)/(n-1)
se = sqrt( ((N - n) / N) * (n / sum(M_i))^2 * (mse/n) )
#se
#[1] 0.1773738

#Computing Confidence Interval
CI <- c(p_est + 2*se, p_est - 2*se)

#CI
#[1]  0.4369393 -0.2725558





