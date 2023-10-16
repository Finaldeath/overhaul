//////Check if PC threatened Devlar
////////

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(GetPCSpeaker(),"Devlar_Hate") ==1;
    return iResult;
}
