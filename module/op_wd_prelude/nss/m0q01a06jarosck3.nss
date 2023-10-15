int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL")==1 &&
                     (GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker()) > 0);
    return bCondition;
}

