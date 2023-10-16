const string sSpeak = "Good riddance!";

void main()
{
    object oPC = GetPCSpeaker();
    object oLyen = GetHenchman(oPC);
    location lWay;

    if (GetTag(oLyen) == "HENCH_BRUK")
    {
        lWay = GetLocation(GetWaypointByTag("WP_CT_COMM_NT_WAIT_02_03"));
        RemoveHenchman(oPC, oLyen);

        AssignCommand(oLyen, SpeakString(sSpeak));
        AssignCommand(oLyen, JumpToLocation(lWay));
    }
}
