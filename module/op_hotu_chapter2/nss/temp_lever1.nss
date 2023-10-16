void main()
{
    object oPC = GetLastUsedBy();
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);

    SetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE", 1);
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    AddHenchman(oPC, oDeekin);
}
