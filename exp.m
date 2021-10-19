%% psychtoolbox_sample.m
%%
%% Initialize
list=[1 2 1 2 ];

try
    % Comment out for desktop PC or high-spec laptop PC
    Screen('Preference', 'SkipSyncTests', 1); 
    
    HideCursor; 
    ListenChar(2); 
    [window, rectW] = Screen('OpenWindow', 0); % Initialize window2
 
    centerX = (rectW(1)+rectW(3))/2;
    centerY = (rectW(2)+rectW(4))/2;
    
    tri_size=30;
    tri_left =  [centerX-tri_size/2*sqrt(3)*2/3, centerX+tri_size/2*sqrt(3)*1/3, centerX+tri_size/2*sqrt(3)*1/3, centerX+tri_size/2*sqrt(3)*1/3, centerX+tri_size/2*sqrt(3)*1/3, centerX-tri_size/2*sqrt(3)*2/3;
                 centerY,                        centerY+tri_size/2,             centerY+tri_size/2,             centerY-tri_size/2,             centerY-tri_size/2,             centerY]; 
    tri_right = [centerX-tri_size/2*sqrt(3)*1/3, centerX+tri_size/2*sqrt(3)*2/3, centerX+tri_size/2*sqrt(3)*2/3, centerX-tri_size/2*sqrt(3)*1/3, centerX-tri_size/2*sqrt(3)*1/3, centerX-tri_size/2*sqrt(3)*1/3;
                 centerY+tri_size/2,             centerY,                        centerY,                        centerY-tri_size/2,             centerY-tri_size/2,             centerY+tri_size/2];
    
    fix_size=30;
    fix = [centerX-fix_size/2, centerX+fix_size/2, centerX,            centerX;
           centerY,            centerY,               centerY-fix_size/2, centerY+fix_size/2];
    
    obj_size=30;
    obj_exc=500;
    
    Screen('FillRect', window, [0 0 0]); % Background draw
    Screen('DrawLines', window, fix, [2 2 2], [255, 255, 255]);
    Screen('FillOval', window, [255 255 255], [centerX-obj_size/2-obj_exc centerY-obj_size/2 centerX+obj_size/2-obj_exc centerY+obj_size/2]);
    Screen('FillOval', window, [255 255 255], [centerX-obj_size/2+obj_exc centerY-obj_size/2 centerX+obj_size/2+obj_exc centerY+obj_size/2]);
    
    Screen('Flip', window); % Display
    WaitSecs(3);
    
catch
    % If an error occurs 
    Screen('CloseAll');
    ListenChar(0);
    ShowCursor;
    psychrethrow(psychlasterror);
end
    
% %% Visual stimuli
% try
%     % Press any key to start
%     %pause; 
%     
%     % Start stimulation
%     for i=1:length(list)
%         
%         % Background draw
%         if list(i)==1
%             Screen('DrawLines', window, tri_left, [2 2 2], [255, 255, 255]);
%             Screen('FillOval', window, [255 255 255], [centerX-obj_size/2-obj_exc centerY-obj_size/2 centerX+obj_size/2-obj_exc centerY+obj_size/2]);
%             Screen('FillOval', window, [255 255 255], [centerX-obj_size/2+obj_exc centerY-obj_size/2 centerX+obj_size/2+obj_exc centerY+obj_size/2]);
%             
%         elseif list(i)==2
%             Screen('DrawLines', window, tri_right, [2 2 2], [255, 255, 255]);
%             Screen('FillOval', window, [255 255 255], [centerX-obj_size/2-obj_exc centerY-obj_size/2 centerX+obj_size/2-obj_exc centerY+obj_size/2]);
%             Screen('FillOval', window, [255 255 255], [centerX-obj_size/2+obj_exc centerY-obj_size/2 centerX+obj_size/2+obj_exc centerY+obj_size/2]);
%             
%         end
%         
%         % Display
%         Screen('Flip', window);
%         WaitSecs(4);
%         
%         % Rest
%         Screen('FillRect', window, [0 0 0]); % Background draw
%         Screen('DrawLines', window, fix, [2 2 2], [255, 255, 255]);
%         Screen('FillOval', window, [255 255 255], [centerX-obj_size/2-obj_exc centerY-obj_size/2 centerX+obj_size/2-obj_exc centerY+obj_size/2]);
%         Screen('FillOval', window, [255 255 255], [centerX-obj_size/2+obj_exc centerY-obj_size/2 centerX+obj_size/2+obj_exc centerY+obj_size/2]);
%         
%         Screen('Flip', window); % Display
%         WaitSecs(2.5+rand);
%     end
%     
% catch
%     % If an error occurs 
%     Screen('CloseAll');
%     ListenChar(0);
%     ShowCursor;
%     psychrethrow(psychlasterror);
% end

%% Finalize
Screen('CloseAll');
ListenChar(0);
ShowCursor;

disp('Bye!!');
