function [mFrames, vTimeFrame] = Windowing(vSignal, SamplingRate, FrameLength, FrameShift)

D=FrameLength*SamplingRate;
E=FrameShift*SamplingRate;

    for p=1:(round((length(vSignal)-D)/E))
        
        vTimeFrame(p)=round(FrameLength/2) +p*FrameShift;
        
        for i=1:D
        
        mFrames(p,i)=vSignal(i+((p-1)*E));
        
        end
    end
end

