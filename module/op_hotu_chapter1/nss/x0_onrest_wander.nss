//::///////////////////////////////////////////////
//:: x0_onrest_wander
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks to see if a wandering
    monster needs to be summoned.
    1.Attach x0_onrest_wander to your module ONPLAYERREST event
    2.For any area where you want wandering monsters to appear you'd do the following in the
    first heartbeat of the area
    SetLocalString(OBJECT_SELF, "NW_L_MYWANDERCREATURE", <resref of creature to spawn>);
    SetLocalInt(OBJECT_SELF, "NW_L_MYCHANCEOFWANDER", <% chance of a wandering monster, defaults to 50%);
    3. -1 percent means 0 percent, 0 percent means variable undefined, default to DEFAULT

*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: July 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"

int C_DEFAULT = 0; // * default percent chance of a wandering monster
float C_DEFAULT_RANGE = 30.0; // * the distance at which the door search is performed

void MakeCreature(location lTarget, string sCreature, object oPC);

void main()
{


    int nRestType = GetLastRestEventType();
    //Check counter to make sure wandering monsters are at least 10 heartbeats apart
    if (nRestType == REST_EVENTTYPE_REST_STARTED  && GetLocalInt(GetModule(), "X2_Q2BREST") < 10)
    {

        int nPercent = GetLocalInt(GetArea(GetLastPCRested()), "NW_L_MYCHANCEOFWANDER");
        if (nPercent == 0)
        {
            nPercent = C_DEFAULT;
        }
        if (nPercent == -1 )
        {
            nPercent = 0;
        }
        // * a wandering monster will be spawned
        if (Random(100) + 1 <= nPercent)
        {
            //Fade screen for a bit for rest event
            FadeToBlack(GetLastPCRested());
            //Then fade in after 5 seconds
            DelayCommand(3.0, FadeFromBlack(GetLastPCRested()));

            //Set module variable that is used in Heartbeat so Wandering Monster events
            //are spaced at least 10 Heartbeats apart.
            SetLocalInt(GetModule(), "X2_Q2BREST", 20);
            int nRandom = Random(3) + 1;
            string sMonster = GetLocalString(GetArea(GetLastPCRested()), "NW_L_MYWANDERCREATURE" + IntToString(nRandom));
            if (sMonster == "")
            {
                return;
            }
            object oPC = GetLastPCRested();
            object oDoor = GetNearestObject(OBJECT_TYPE_DOOR, oPC);
            location lPos = GetLocation(oPC); // * this is where the creature will appear
                                              // * defaults to beside PC
            //Not going to use the spawn near doors for now as it seems to spawn on the
            //opposite side from the player
            /*
            // * if there is a door near the player
            // * spawn the creauture there
            if (GetIsObjectValid(oDoor) == TRUE)
            {
                if (GetDistanceBetween(oPC, oDoor) <= C_DEFAULT_RANGE)
                {
                    //Place any exception doors here - doors that for whatever reason
                    //should not be where the monster should spawn.
                    if (GetTag(oDoor) != "at_level1_level2")
                        lPos = GetLocation(oDoor);
                }
            }
            */
            object oBeast = OBJECT_INVALID;
            // * spawn appropriate number of creatures
            int nNumber = GetLocalInt(GetArea(GetLastPCRested()), "NW_L_MYWANDERNUMBER");
            if (nNumber == 0)
            {
                nNumber = 1;
            }
            int i = 0;
            nNumber = Random(nNumber + 1); // * randomize to this many number of creatures
            //Your rest has been disturbed by a wandering monster.
            FloatingTextStrRefOnCreature(85676, oPC);
            for (i = 1; i<= nNumber; i++)
            {
                DelayCommand(2.0, MakeCreature(lPos, sMonster, oPC));

            }

        }
    }
}

// Create a creature, done so that it could be delayed.
void MakeCreature(location lTarget, string sCreature, object oPC)
{

    object oBeast = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lTarget);
    AssignCommand(oBeast, ClearAllActions());
    DelayCommand(1.0, AssignCommand(oBeast, ActionMoveToObject(oPC, TRUE)));
    DelayCommand(4.0, AssignCommand(oBeast, DetermineCombatRound(oPC)));
}
