void main()
{
    object oEnivid = GetObjectByTag("q2_enivid");
    int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES") - 1;
    SetLocalInt(GetModule(), "OS_ENIVID_VOTES", nEnivid);

    object oPC = GetFirstPC();
    int nPC = GetLocalInt(oPC,"OS_PC_VOTES") + 1;
    SetLocalInt(oPC,"OS_PC_VOTES", nPC);

    object oBecket = GetObjectByTag("q2_sirbecket");
    int nBecket = GetLocalInt(GetModule(), "OS_BECKET_VOTES");

    SpeakString("ENIVID - " + IntToString(nEnivid)
        + "; BECKET - " + IntToString(nBecket)
        + "; PLAYER - " + IntToString(nPC));
}
