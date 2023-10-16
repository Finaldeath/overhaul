int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 0;
    if(iResult == TRUE)
        {
        SetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown",30);
        DelayCommand(2.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
        }
    return iResult;
}
