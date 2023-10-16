///Check if PC is bringing Leesa back BUT Luce cannot see her yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==1 &&
              GetLocalInt(GetPCSpeaker(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==2 &&
              GetObjectSeen(GetNearestObjectByTag("M4Q01B08LEES")) == FALSE ;
    return iResult;
}


