// Farghan knows that Drogan is poisoned

int StartingConditional()
{
    int nTold = GetLocalInt(OBJECT_SELF, "q1h_Herbalist_Told_Drogan");
    if (nTold == 1)
    {
        return TRUE;
    }
    return FALSE;
}
