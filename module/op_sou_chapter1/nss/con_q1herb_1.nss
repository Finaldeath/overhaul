//con_q1herb_1
//Return TRUE if the herbalist/cook has not given his/her cure to the PC yet
//
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nCureGiven") != 1)
        return TRUE;
    return FALSE;
}
