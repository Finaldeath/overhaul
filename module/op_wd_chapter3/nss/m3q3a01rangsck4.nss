/////Check if Devlar talked to yet

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetPCSpeaker(),"Devlar_Talk") ==1;
    return iResult;
}

