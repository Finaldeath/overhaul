//::///////////////////////////////////////////////
//:: Name hx_slp_ariroo_y2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Aribeth is in area check and alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetArea(GetObjectByTag("H2_Aribeth")) == GetArea(GetObjectByTag("H2_SleepingMan")))
    {
        if(!GetIsDead(GetObjectByTag("H2_Aribeth")))
        {
            return TRUE;
        }
    }
    return FALSE;
}
