int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M3Q02TALKFORTILKARDSIEGE") == 1
                && GetLocalInt(GetPCSpeaker(),"SoldierSeigeTalk")==0;
    return iResult;
}
