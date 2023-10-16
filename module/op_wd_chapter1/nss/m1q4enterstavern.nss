void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_SeedyTavern") == 0)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_SeedyTavern",10);
    }
    object oClicker = GetPCSpeaker();
    object oTarget = GetTransitionTarget(OBJECT_SELF);
    object oDoor = GetObjectByTag("M1Q4F_M1Q4A");
    //AssignCommand(oDoor,ActionOpenDoor(oDoor));
    location lLoc = GetLocation(oTarget);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    AssignCommand(oClicker,ClearAllActions());
    AssignCommand(oClicker,JumpToObject(oDoor));

}
