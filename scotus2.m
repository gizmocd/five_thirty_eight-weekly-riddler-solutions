%SCOTUS SIZE PREDICTOR


%years modelled
years = input('Number of years to look at: ');

%collected data
yearly_scotus_number = zeros(1,years);

%globals in main calculation
pp = 42;
sp1 = 43;% magic numbers
sp2 = 43;% magic numbers
sp3 = 43;% magic numbers
SCOTUS = zeros(1,9);

%main calculation
for current_year=1:years
    %reelection every 4 years
    
    if mod(current_year,4) == 0
        pp = randi(2);
    end
    
    %senate class 1
     if mod(current_year,6) == 0
        sp1 = randi(2);
     end
    
    %senate class 2
    if mod(current_year-2,6) == 0
        sp2 = randi(2);
     end
    
    %senate class 3
    if mod(current_year-4,6) == 0
        sp3 = randi(2);
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
    
    % (first determine senate party majority)
    if sp1 == sp2
        sp = sp1;
    elseif sp2 == sp3
        sp = sp2;
    elseif sp1 == sp3
        sp = sp1;
    end
    
    % (now choose justices if senate and presidential party match)
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
    
    
