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
se = sqrt(((N-n)/N)* (n/sum(M_i))^2 * (mse/n))

#se
#[1] 0.03303254

#Computing Confidence Interval
CI <- c(p_est + 2*se, p_est - 2*se)

#CI
#[1]  0.1482569 0.0161267





