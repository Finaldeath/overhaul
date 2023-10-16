int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTUTHGARDTELKTRIBE") ==99 && GetLocalInt(GetPCSpeaker(),"SoldierTribeTalk")==0;
    return iResult;
}
