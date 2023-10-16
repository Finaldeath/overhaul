//Return true if there is anything at all in Drogan's
//Focus Crystal table
int StartingConditional()
{
    object oTable = GetObjectByTag("q1a2focustableinv");
    object oItem = GetFirstItemInInventory(oTable);
    if (oItem != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
