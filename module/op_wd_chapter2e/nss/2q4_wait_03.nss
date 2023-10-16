//::///////////////////////////////////////////////
//:: Waitress Check
//:: 2Q4_Wait_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check the local to see if the waitress should
    a: ask for an order
    b: fill the order
    c: return the order.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2001
//:://////////////////////////////////////////////


int StartingConditional()
{
    int nWait = GetLocalInt(OBJECT_SELF, "NW_2Q4_BARMAID_STATE");
    if(nWait == 3)
    {
        return TRUE;
    }
    return FALSE;
}
