// the dog disappears and runs to Bethsheva

void main()
{
    object oWP = GetObjectByTag("mn_herbalist");
    SetLocalInt(GetModule(), "q1b_Bethsheva_Secret", 2);
    GiveXPToCreature(GetPCSpeaker(), 50);

    // the dog runs off
    ClearAllActions();
    ActionMoveToObject(oWP, TRUE);
    DestroyObject(OBJECT_SELF, 5.0);
    SetCommandable(FALSE);
}
