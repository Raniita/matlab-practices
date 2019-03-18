n = 30;

index_binom = 0;
index_prob = 0;

entropy = zeros(1,30);
freq = zeros(1,11);

for k=0:30
index_binom = index_binom + 1;
    for p=0:0.1:1
        index_prob = index_prob + 1;
        prob = binomMass(k,n,p);
        freq(index_prob) = prob;
    end
    
    entropy(index_binom) = entropia(freq);
end

histogram(entropy)