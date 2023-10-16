//::///////////////////////////////////////////////
//:: Name x2_def_heartbeat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gelatinous Cube Heartbeat
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: Sept 16/03
//:://////////////////////////////////////////////

#include "x0_i0_spells"
#include "x2_i0_spells"
#include "x2_inc_cutscene"

void main()
{
    if(GetLocalInt(GetModule(), "X2_ActiveCutsceneNumber") == 81) // gelly cutscene
        return;
    ExecuteScript("x2_c2_gcube_hbt", OBJECT_SELF);
}

