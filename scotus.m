%SCOTUS SIZE PREDICTOR


%years modelled
years = 1000000;%**make this user determined later

%collected data
yearly_scotus_number = zeros(1,years);

%globals in main calculation
pp = 42;
sp = 43;% magic numbers
SCOTUS = zeros(1,9);
presidential_party = 'd';
senate_party = 'r';% these will change (fourth!?) iteration
                   % NOTE: this lack of randomness will be insignificant
                   % with long-term modelling... 
%main calculation
for current_year=1:years
    %reelection every 4 years
    %include senate for now (add 6 year cycles later)
    if mod(current_year,4) == 0
        pp = randi(2);
        sp = randi(2);%50-50 chances
        if pp == 1
            presidential_party = 'd';% d for democrat
        else
            presidential_party = 'r';% r for republican
        end
        if sp == 1
            senate_party = 'd';% d for democrat
        else
            senate_party = 'r';% r for republican
        end
    end
    
    % Next, decrement each judges remaining years (if zero do nothing).
    for i=1:9
       if SCOTUS(i) ~= 0
           SCOTUS(i) = SCOTUS(i) - 1;
       end
    end
    
    % Now, if the same party controls the senate and the executive branch,
    % add judges to SCOTUS with total years selected as a random integer
    % (MATLAB's randi function for this is uniformly distributed luckily)
    % between zero and 40. This number will be decremented each iteration.
    if pp == sp
        for i=1:9
            if SCOTUS(i) == 0
            	SCOTUS(i) = randi(41) - 1;% {randi 41 is 1 to 41, so minus
            end                           %  one just to make it 0 to 40}
        end
    end
 
 % And finally, collect data
    dummy_count = 0;
    for i=1:9
        if SCOTUS(i) ~= 0
            dummy_count = dummy_count + 1;
        end                           
    end
    yearly_scotus_number(current_year) = dummy_count;
 
end

%Then, plot the data for easy/lazy analysis

stem(yearly_scotus_number), xlabel('Year'), 
ylabel('Number of Judges'), title('Number of Judges Over the Years');
    
    