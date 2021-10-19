%% visualtactile.m
%%
%% Initialize
list=[1 2 3 4 1 2 3 4];

try
    % Comment out for desktop PC or high-spec laptop PC
    Screen('Preference', 'SkipSyncTests', 1);

    HideCursor;
    ListenChar(2);
    [window, rectW] = Screen('OpenWindow', 0); % Initialize window2

    centerX = (rectW(1)+rectW(3))/2;
    centerY = (rectW(2)+rectW(4))/2;

    fix_size=30;
    fix = [centerX-fix_size/2, centerX+fix_size/2, centerX,            centerX;
           centerY,            centerY,               centerY-fix_size/2, centerY+fix_size/2];

    % Visual stimuli
    vis_exc=500;
    vis_size=30;
    vis_left  = [centerX-vis_exc-vis_size/2 centerY-vis_size/2 centerX-vis_exc+vis_size/2 centerY+vis_size/2];
    vis_right = [centerX+vis_exc-vis_size/2 centerY-vis_size/2 centerX+vis_exc+vis_size/2 centerY+vis_size/2];

    % Somatoesensory stimuli
    len_rect = 50;
    somato_left  = [0                     rectW(4)-30-len_rect len_rect              rectW(4)-30];
    somato_right = [rectW(3)/3-len_rect/2 rectW(4)-30-len_rect rectW(3)/3+len_rect/2 rectW(4)-30];

    Screen('FillRect', window, [96 96 96]); % Background draw 0-255
    Screen('DrawLines', window, fix, [2 2 2], [255, 255, 255]);
    Screen('FillRect', window, [0 0 0], somato_left);
    Screen('FillRect', window, [0 0 0], somato_right);

    Screen('Flip', window); % Display
    WaitSecs(3);

catch
    % If an error occurs
    Screen('CloseAll');
    ListenChar(0);
    ShowCursor;
    psychrethrow(psychlasterror);
end

%% Finalize
Screen('CloseAll');
ListenChar(0);
ShowCursor;

disp('Bye!!');