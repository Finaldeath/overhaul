/////// Plot done, inside Moonstone Mask


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==2
        && ((GetLocalObject(GetModule(),"NW_G_M4Q01PLOTLEESA_SAVIOUR")==GetPCSpeaker())
        || (GetFactionEqual(GetLocalObject(GetModule(),"NW_G_M4Q01PLOTLEESA_SAVIOUR"),GetPCSpeaker())));

    return iResult;
}
