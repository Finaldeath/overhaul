int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                      GetLocalInt(OBJECT_SELF, "Generic_Surrender") == 1 &&
                      (GetLevelByClass(CLASS_TYPE_BARBARIAN,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_BARD,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_FIGHTER,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_MONK,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_PALADIN,GetPCSpeaker()) > 0 ||
                      GetLevelByClass(CLASS_TYPE_RANGER,GetPCSpeaker()) > 0);
    return bCondition;
}
