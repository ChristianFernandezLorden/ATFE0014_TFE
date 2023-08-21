function matrixToCsv(filename, matrix, vectors, names)
    nb_points = prod(size(matrix), 'all');
    
    dims = zeros(length(vectors), 1);
    if length(vectors) == 1
        matrix = squeeze(matrix);
        if size(matrix, 1) ~= 1 && size(matrix, 2) ~= 1
            disp("Incompatible number of dimensions (expected 1, got "+size(matrix, 1)+")")
            return
        end
        
        output_table = zeros(nb_points, 2);
        pos = [1]; 
        dims = [length(matrix)];
    else
        for i = 1:length(vectors)
            dims(i) = length(vectors{i});
            if dims(i) ~= size(matrix, i)
                disp("Incompatible dimension size")
                return
            end
        end

        output_table = zeros(nb_points, length(dims)+1);
        pos = ones(length(dims), 1);
    end

    
    for i = 1:nb_points
        for j = 1:length(dims)
            output_table(i, j) = vectors{j}(pos(j));
        end
        output_table(i, length(dims)+1) = matrix(i);

        p = 1;
        while p <= length(pos)
            pos(p) = pos(p)+1;
            if pos(p) > dims(p)
                pos(p) = 1;
                p = p+1;
            else
                break
            end
        end
    end

    T = array2table(output_table, 'VariableNames', [names, "value"]);

    writetable(T, filename);
end