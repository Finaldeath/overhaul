///Check if PC agreed to get Leesa, and Leesa not back yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==0 &&
              GetLocalInt(GetPCSpeaker(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==1;

    return iResult;
}
