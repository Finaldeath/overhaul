//con_q2dgate_1
//Return FALSE if the PCs mind is shielded by the Helm.
//TRUE if the PC is UNshielded
int StartingConditional()
{
    //if the PC is working for the elder brain - the mindflayer's won't care
    //if the PC has the helmet on or not
    if (GetLocalInt(GetModule(),"elder_brain") > 1)
        return FALSE;

    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X2_Q2DMindShielded") == 1)
        return FALSE;

    return TRUE;
}
