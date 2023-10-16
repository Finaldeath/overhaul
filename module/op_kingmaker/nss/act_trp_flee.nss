//::///////////////////////////////////////////////
//:: act_trp_flee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip flees
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void main()
{
    object oTrip = OBJECT_SELF;
    object oModule = GetModule();
    object oWay = GetWaypointByTag("q3_way_henchfleeX");
    effect eGhost = EffectCutsceneGhost();

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oTrip);

    AssignCommand(oModule, QuitHenchman(GetFirstPC(), oTrip));

    AssignCommand(oModule, AssignCommand(oTrip, SetIsDestroyable(TRUE, FALSE, FALSE)));
    AssignCommand(oModule, AssignCommand(oTrip, ActionForceMoveToObject(oWay, TRUE, 0.0f, 3.0f)));
    AssignCommand(oModule, DestroyObject(oTrip, 2.0f));
}
