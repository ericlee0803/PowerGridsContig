%% Genplot is simply a script to generate plots with specific properties

% ~~~~~~~~~INPUTS~~~~~~~~~ %

% method = method type number one would like to use
% numtrials = number of trials desired
% noise = percentage of max amplitude to add as gaussian noise
% window = percentage of PMUs visible

% ~~~~~~~~~OUTPUTS~~~~~~~~~ %

% A .png file with the desired image
% out = The Confusion Matrix
% confidence = array of confidence measures from each
%               trial instance

function [out,confidence] = genplot(method, numtrials, noise, window)

  load metadata.mat

  %   temp variables
  M = zeros(numcontigs);
  C = zeros(1,numtrials);
  counter = 1;

  for n = 1:numtrials
    [i,j,con] = testbed(method, noise, window);
    M(i,j) = M(i,j) + 1;
    if(i == j)
      C(counter) = con;
      counter = counter + 1;
    end
  end

  % set outputs
  out = M;
  confidence = C;

end
