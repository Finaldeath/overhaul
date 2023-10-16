// first time Elaith is spoken to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Player_Met_Elaith") == 0;
    return iResult;
}
