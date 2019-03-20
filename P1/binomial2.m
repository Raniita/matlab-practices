%%La forma correcta de hacerlo
n = 30;

index_prob = 0;
index_try = 0;

entropy = zeros(1,11);

for p=0:0.1:1
    index_prob = index_prob + 1;
    freq = zeros(1,31);
    index_try = 0;
    for k=0:30
        index_try = index_try + 1;
        prob = binomMass(k,n,p);
        freq(index_try) = prob;
    end
    entropy(index_prob) = entropia(freq);
end

plot(0:0.1:1, entropy);