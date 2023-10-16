//::///////////////////////////////////////////////
//:: act_jab_flee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jaboli flees
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void main()
{
    object oJab = OBJECT_SELF;
    object oModule = GetModule();
    object oWay = GetWaypointByTag("q3_way_henchfleeX");
    effect eGhost = EffectCutsceneGhost();

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oJab);

    AssignCommand(oModule, QuitHenchman(GetFirstPC(), oJab));

    AssignCommand(oModule, AssignCommand(oJab, SetIsDestroyable(TRUE, FALSE, FALSE)));
    AssignCommand(oModule, AssignCommand(oJab, ActionForceMoveToObject(oWay, TRUE, 0.0f, 3.0f)));
    AssignCommand(oModule, DestroyObject(oJab, 2.0f));
}
