//Has Sphinx been asked for better reward?
int StartingConditional()
{
    object oRunemachine = GetObjectByTag("Q3B_ENGINE");
    if (!GetIsObjectValid(oRunemachine))
        return TRUE;
    return FALSE;
}
