function [ color ] = getDescreteColorForScore( pain_score,num_of_scores )

m = 255;

green = [110/m;250/m;86/m];
lightgreen = [191/m;247/m;41/m];
yellow = [255/m;240/m;0/m];
orange = [255/m;153/m;0/m];
red = [243/m;45/m;22/m];

switch num_of_scores
    case 1
        color = green;
    case 2
        switch pain_score
            case 0
                color = green;
            case 1
                color = red;
        end
    case 3
        switch pain_score
            case 0
                color = green;
            case 1
                color = yellow;
            case 2
                color = red;
        end
    case 4
        switch pain_score
            case 0
                color = green;
            case 1
                color = yellow;
            case 2
                color = orange;
            case 3
                color = red;
        end
    case 5
        switch pain_score
            case 0
                color = green;
            case 1
                color = lightgreen;
            case 2
                color = yellow;
            case 3
                color = orange;
            case 4
                color = red;
        end
end

end

