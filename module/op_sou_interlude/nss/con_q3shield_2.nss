// Check if SG is broken
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_Q3SHIELDGUARDIAN")==20)
        return TRUE;
    return FALSE;
}

