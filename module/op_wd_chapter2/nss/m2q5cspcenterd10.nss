int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5EnteredDungeon") == 10 &&
                GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") != GetPCSpeaker();
    return l_iResult;
}
