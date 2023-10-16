// Check if devil is dead.
int StartingConditional()
{
    object oDemon = GetObjectByTag("hx_out_devil");

    if(!GetIsObjectValid(oDemon) || GetIsDead(oDemon))
    {
        return TRUE;
    }
    return FALSE;
}
