//::///////////////////////////////////////////////
//:: Name con_xp2seer_10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Matron Myrune is dead. Only shows up once.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct. 22, 2003
//:://////////////////////////////////////////////

#include "x2_inc_globals"
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"Zesyyr_Rule")== TRUE
        && GetLocalInt(OBJECT_SELF, "nMyruneReported") == 0)
        return TRUE;
    return FALSE;
}

