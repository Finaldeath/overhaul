int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bCondition = GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1S4BarOwner")) == FALSE &&
                     ( GetLevelByClass(CLASS_TYPE_BARBARIAN,oPC) == 0 &&
                       GetLevelByClass(CLASS_TYPE_FIGHTER,oPC) == 0 &&
                       GetLevelByClass(CLASS_TYPE_PALADIN,oPC) == 0 &&
                       GetLevelByClass(CLASS_TYPE_RANGER,oPC) == 0 );

    return bCondition;
}

