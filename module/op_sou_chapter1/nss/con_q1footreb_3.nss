//return true if the cage door is gone.
//con_q1footreb_3
int StartingConditional()
{
    object oDoor1 = GetObjectByTag("q1rumgutcage1");
    if (oDoor1 == OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
