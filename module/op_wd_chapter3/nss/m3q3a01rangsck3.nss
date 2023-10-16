/////Check if Devlar not talked to yet

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetPCSpeaker(),"Devlar_Talk") ==0;
    return iResult;
}
