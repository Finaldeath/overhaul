int StartingConditional()
{
    int l_iResult;

    l_iResult = GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M1S04IBADGELVL03")) &&
                GetLocalInt(GetModule(),"NW_G_Map_M1S4F_Occupied") == 1;
    return l_iResult;
}
