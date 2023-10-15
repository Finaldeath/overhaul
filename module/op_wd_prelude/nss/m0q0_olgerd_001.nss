void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);
    object oDoor = GetNearestObjectByTag("M0Q0_DOOR2");
    SetLocked(oDoor,FALSE);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
    //ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_KNOCK),oDoor);

    /*oDoor = GetNearestObjectByTag("M1Q0B_M1Q0A");
    SetLocked(oDoor,TRUE);
    AssignCommand(oDoor,ActionCloseDoor(oDoor));*/


}
