void main()
{
    object oPC = GetPCSpeaker();
    object oHench = GetHenchman(oPC);
    location lWay;

    if (GetTag(oHench) == "HENCH_BRUK")
    {
        lWay = GetLocation(GetWaypointByTag("WP_SAFEJUMP_LYEN"));

        AssignCommand(oPC, JumpToLocation(lWay));
        AssignCommand(oHench, JumpToLocation(lWay));
    }
}
