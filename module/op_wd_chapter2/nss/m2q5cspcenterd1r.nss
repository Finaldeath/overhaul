int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5EnteredDungeon") == 10 &&
              GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") != GetPCSpeaker() &&
              Random(2);
    return iResult;
}
