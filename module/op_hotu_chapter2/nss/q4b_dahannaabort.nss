//::///////////////////////////////////////////////
//:: q4b_dahannaabort
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Assigns appropriate commands if player aborts conversation early
*/

//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "nw_i0_plot"

void Leave(object oDuergar)
{
    object oWP = GetWaypointByTag("q4a_wp_duergar_leave");
    SetPlotFlag(oDuergar, TRUE);
    AssignCommand(oDuergar, ClearAllActions());
    AssignCommand(oDuergar, ActionForceMoveToObject(oWP));
    AssignCommand(oDuergar, ActionDoCommand(DestroyObject(oDuergar)));
    DelayCommand(1.0, SetCommandable(FALSE, oDuergar));
}


void main()
{

     object oPC = GetPCSpeaker();

     ///if duergar are threatening the player, make them attack

    if (GetLocalInt(GetModule(),"Dahanna_End")==1)
        {
        AdjustReputation(oPC, OBJECT_SELF, -100);
        AdjustReputation(OBJECT_SELF, oPC, -100);
        DetermineCombatRound(oPC);

        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
        while(oCreature != OBJECT_INVALID)
            {
            if(GetStringLeft(GetTag(oCreature),  3) == "q4a")
            {
            AssignCommand(oCreature, DetermineCombatRound());
            DelayCommand(12.0, AssignCommand(oCreature, bkEquipMelee()));
            }
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
            }
         }


      ///if duergar are appeased by the player, they leave

    if (GetLocalInt(GetModule(),"Dahanna_End")==99)
        {
            object oCleric = GetObjectByTag("q4a_DuergarMerchant");
            Leave(oCleric);
            int i;
            object oWarrior;
            for(i = 1; i <= 7; i++)
            {
                oWarrior = GetObjectByTag("q4a_DuergarWarrior" + IntToString(i));
                Leave(oWarrior);
            }
            Leave(OBJECT_SELF);
            Reward_2daXP(GetFirstPC(), 36);


        ///All duergar leave
        }


    ///if end conversation hasn't happened yet, walk waypoints
    if (GetLocalInt(GetModule(),"Dahanna_End")==0)
        {
        //Duergar walk waypoints, wander around, ambient animations
        }
}

