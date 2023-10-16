// the PC is not in sight of the minister or the nurse
// or not in sight of the other three (or is thought a god)

int StartingConditional()
{
    object oPriest = GetObjectByTag("Q5B_PRIEST");
    object oNurse = GetObjectByTag("Q5A_NURSE");
    object oWorship1 = GetObjectByTag("Q5A_RIFKIN");
    object oWorship2 = GetObjectByTag("Q5A_TALISSICIA");
    object oWorship3 = GetObjectByTag("Q5A_TELNIX");

    if ((GetIsObjectValid(oPriest)) && (GetObjectSeen(GetPCSpeaker(), oPriest)))
    {
        return FALSE;
    }
    if ((GetIsObjectValid(oNurse)) && (GetObjectSeen(GetPCSpeaker(), oNurse)))
    {
        return FALSE;
    }
    if ((GetIsObjectValid(oWorship1)) && (GetObjectSeen(GetPCSpeaker(), oWorship1)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return FALSE;
    }
    if ((GetIsObjectValid(oWorship2)) && (GetObjectSeen(GetPCSpeaker(), oWorship2)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return FALSE;
    }
    if ((GetIsObjectValid(oWorship3)) && (GetObjectSeen(GetPCSpeaker(), oWorship3)) && (GetLocalInt(GetPCSpeaker(), "X1_PCISGOD") != 10))
    {
        return FALSE;
    }

    return TRUE;
}
