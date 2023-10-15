int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1 &&
                     (GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker())> 0);
    return bCondition;
}

