/// Only shows up if player has not accepted trial yet

int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"TrialAccepted") !=1;
    return l_iResult;
}

