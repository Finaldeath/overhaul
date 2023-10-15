int StartingConditional()
{

    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_ROGUE_ITEM")) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_ROGUE_TEST") == 1 &&
                     (GetLevelByClass(CLASS_TYPE_BARD,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_ROGUE,GetPCSpeaker()) > 0);

    return bCondition;
}

