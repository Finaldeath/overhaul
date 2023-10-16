///Check if PC brought Leesa to Moonstone Mask, but has not been rewarded

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==1
              //GetLocalInt(GetPCSpeaker(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==2 &&
              && GetObjectSeen(GetNearestObjectByTag("M4Q01B08LEES")) == TRUE;
    return iResult;
}
