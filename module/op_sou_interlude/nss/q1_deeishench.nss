// Deekin is the current PC henchman

int StartingConditional()
{
    object oHench1 = GetHenchman(GetPCSpeaker());
    object oHench2 = GetObjectByTag("x0_hen_dee");
    if (oHench1 == oHench2)
    {
        return TRUE;
    }
    return FALSE;
}
