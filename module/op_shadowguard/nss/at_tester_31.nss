void main()
{
    object oWP = GetNearestObjectByTag("WP_PC_ROPE_L");

    location lWP = GetLocation(oWP);

    CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_PC_ROPE", lWP);
}
