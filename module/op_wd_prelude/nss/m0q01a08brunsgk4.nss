int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_ROGUE_TEST") == 1 &&
                     !GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"NW_ROGUE_ITEM"));

    return bCondition;
}

