int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1 &&
                GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100 &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5DPassStone"));
    return l_iResult;
}

