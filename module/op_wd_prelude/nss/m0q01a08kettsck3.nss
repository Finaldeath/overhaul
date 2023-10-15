int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1 &&
                     (GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker())> 0) &&
                     !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_ROGUE_ITEM"));
    return bCondition;
}

