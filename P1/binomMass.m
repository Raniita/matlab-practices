function p = binomMass(k, n, p)

    binom = nchoosek(n,k);
    p = binom*p^k*(1-p)^(n-k);

end