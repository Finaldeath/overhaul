//::///////////////////////////////////////////////
//:: Lazy the Imp, Exit (Action Script)
//:: H2a_Lazy_Exit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Freed from the Grinder, Lazy the Imp exits.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

void main()
{
    //Destroy the invisible placeable.
    DestroyObject(OBJECT_SELF, 1.0);

    //Resurrect the body.
    object oBody = GetObjectByTag("H2_LazyBody");
    effect eRez = EffectDisappear();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRez, oBody);

    //Move Lazy to the designated Exit waypoint
    //object oWP = GetObjectByTag("WP_QuarryExit");
    //AssignCommand(oBody, ActionMoveToObject(oWP));

    //Destroy Lazy after 20 seconds
    //AssignCommand(oBody, SetIsDestroyable(TRUE));
    //DestroyObject(oBody, 20.0);
}
