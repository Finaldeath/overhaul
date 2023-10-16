// Check if SG recognizes PC
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_Q3SHIELDGUARDIAN")==10)
        return TRUE;
    return FALSE;
}
