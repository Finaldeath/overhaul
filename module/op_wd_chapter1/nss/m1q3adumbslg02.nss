void main()
{
    object oSelf = OBJECT_SELF;
    SetLocalInt(GetPCSpeaker(),"NW_G_M1Q3BPermission",TRUE);
    SetLocalInt(oSelf,"NW_L_Unlocking",TRUE);
    // **************
    // * Patch 2 Mod
    // * Redundancy:Make Grommin not activate conversation
    // * with player a second time
    // * by setting a local that should've been set
    // * Brent.
    SetLocalInt(GetPCSpeaker(),"NW_L_Init_" + GetTag(OBJECT_SELF), TRUE);

    // **************


    ActionMoveToObject(GetNearestObjectByTag("WP_M1Q3BDoor"));
    ActionOpenDoor(GetNearestObjectByTag("M1Q3BLockedDoor"));
    ActionMoveToObject(GetNearestObjectByTag("WP_M1Q3BDumb"));
    ActionDoCommand(SetLocalInt(oSelf,"NW_L_UNLOCKING",FALSE));
}
