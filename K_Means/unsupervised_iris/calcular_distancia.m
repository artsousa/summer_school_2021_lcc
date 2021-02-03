function D = calcular_distancia(p, q)
    D = sqrt(sum((p - q).^2));
end