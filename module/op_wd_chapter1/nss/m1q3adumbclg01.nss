int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF,"NW_L_M1Q3BWarn") == 1 ||
           GetIsObjectValid(GetPCSpeaker()) ==FALSE;
}
