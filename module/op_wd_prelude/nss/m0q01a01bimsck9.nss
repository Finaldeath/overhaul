int StartingConditional()
{
    object oPC = GetLocalObject(OBJECT_SELF,"NW_L_CurrentPC");
    int bCondition = GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 4 &&
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q0Rested") == FALSE;
    return bCondition;
}


