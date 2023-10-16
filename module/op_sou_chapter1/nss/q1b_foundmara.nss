// if the PC has found Mara's body but has not reported that yet

int StartingConditional()
{
    int nBody = GetLocalInt(GetPCSpeaker(), "X1_FoundMara");
    int nTold = GetLocalInt(GetModule(), "Captive_Cook");
    if ((nBody == 1) && (nTold == 1))
    {
        return TRUE;
    }
    return FALSE;
}
