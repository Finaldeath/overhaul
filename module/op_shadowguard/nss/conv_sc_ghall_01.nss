void main()
{
    object oPC = GetPCSpeaker();

    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK", oPC);

    object oWP = GetNearestObjectByTag("WP_EXIT");

    location lWP = GetLocation(oWP);

    AssignCommand(oHarkon, ActionMoveToLocation(lWP));

    DestroyObject(oHarkon, 4.0);
}
