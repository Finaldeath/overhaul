//con_q2d4door_1
//return TRUE if the check was successful and the door is open.

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nOpen") == 1)
        return TRUE;
    return FALSE;
}
