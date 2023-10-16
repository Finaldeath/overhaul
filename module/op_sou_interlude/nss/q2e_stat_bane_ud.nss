//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_DAMAGED)
    {

        if(GetCurrentHitPoints() == 1)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KILL_STATUE_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_KILL_STATUE_ONCE", 1);

            AssignCommand(GetLastDamager(), ClearAllActions());
            AssignCommand(GetLastDamager(), PlaySound("as_na_rockfallg1"));
            vector vPos = GetPosition(OBJECT_SELF);
            int i;
            location lLoc;
            object oDust;
            effect eVis = EffectVisualEffect(353);

            object oCont = CreateObject(OBJECT_TYPE_PLACEABLE, "q2d_inv_cont", GetLocation(OBJECT_SELF));
            object oRubble = CreateObject(OBJECT_TYPE_PLACEABLE, "q2d_statue_rub", GetLocation(oCont));

            for(i = i; i <= 5; i++)
            {
                lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
                vPos.z += 0.5;
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);
            }

            SetImmortal(OBJECT_SELF, FALSE);
            object oWP = GetWaypointByTag("Q2E_WP_STATUE_JUMP");
            // clear actions for all nearby creatures so they won't try to run after the jumped
            // statue
            int n = 1;
            object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
            while(oCreature != OBJECT_INVALID && GetArea(OBJECT_SELF) == GetArea(oCreature))
            {
                AssignCommand(oCreature, ClearAllActions());
                n++;
                oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
            }

            JumpToObject(oWP);
            effect eDeath = EffectDeath();
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF));


        }
    }
    return;

}
