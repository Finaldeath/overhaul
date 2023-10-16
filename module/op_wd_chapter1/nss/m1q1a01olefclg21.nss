int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Armor")) &&
                     GetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned") == FALSE;
    return bCondition;
}
