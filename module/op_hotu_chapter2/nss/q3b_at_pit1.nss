// Use a rope to go down the pit

void main()
{
    object oPC = GetPCSpeaker();
    object oRope = GetItemPossessedBy(oPC, "q3b_rope");
    DestroyObject(oRope);
    location lLoc = GetLocation(GetObjectByTag("q3c_wp_rope"));
    CreateObject(OBJECT_TYPE_PLACEABLE, "q3_plc_rope", lLoc);
    AssignCommand(oPC, JumpToLocation(lLoc));
    SetLocalInt(OBJECT_SELF, "HAS_ROPE", 1);
}
