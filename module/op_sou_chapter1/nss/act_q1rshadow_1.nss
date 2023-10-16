void main()
{
    object oPC = GetPCSpeaker();
    DestroyObject(OBJECT_SELF, 4.0);
    ActionMoveAwayFromObject(oPC, TRUE);
    SetCommandable(FALSE);

}
