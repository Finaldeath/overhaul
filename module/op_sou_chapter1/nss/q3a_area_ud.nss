// gnoll layer user defined event handler:
// 101: get rid of bears in chief hall.
// 102: get rid of kobolds in chiefhall.
// 103: kobolds jump in to help fight

#include "q3_inc_plot"
#include "nw_i0_generic"

void FightGnolls(object oKobold)
{
    object oChief = GetObjectByTag("Q3_CHIEF_GISHNAK");
    SetIsTemporaryEnemy(oChief, oKobold);

    if(oChief == OBJECT_INVALID)
        return;

    AssignCommand(oKobold, ActionMoveToObject(oChief, TRUE));
    AssignCommand(oKobold, DetermineCombatRound());

}

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101) // bears escape
    {
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        object oBear;
        int i;
        for(i = 1; i <=3; i++)
        {
            oBear = GetNearestObjectByTag("NW_BEARBLCK", OBJECT_SELF, i);
            if(oBear == OBJECT_INVALID)
                return;
            AssignCommand(oBear, ClearAllActions());
            AssignCommand(oBear, ActionMoveToObject(oWP, TRUE));
            AssignCommand(oBear, ActionDoCommand(DestroyObject(oBear)));
            //SetCommandable(FALSE, oBear);
        }

    }
    else if(nEvent == 102) // kobolds escape
    {
        int i = 1;
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        object oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, oWP, i);


        // handle Nafeeli status to be used in the dragon caves:
        object oNafeeli = GetObjectByTag("Q3_NAFEELI");
        DestroyObject(oNafeeli, 10.0);
        int nStatus = GetLocalInt(GetModule(), "q5_Nafeeli_Status");
        if(nStatus == 0)
            SetLocalInt(GetModule(), "q5_Nafeeli_Status", 1); //escaped status

        object oChief = GetObjectByTag("Q3_CHIEF_GISHNAK");
        // should be valid even when chief is dead (body stays)
        if(oChief == OBJECT_INVALID)
            return;

        AdjustReputation(oKobold, oChief, 50);
        AdjustReputation(oChief, oKobold, 50);
        while(oKobold != OBJECT_INVALID)
        {
            i++;
            SignalEvent(oKobold, EventUserDefined(101));

            //SetCommandable(FALSE, oKobold);
            oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, oWP, i);
        }
        //Make all remaining gnolls hostile -
       //may have to deactivate encounters  object oEnc1 = GetObjectByTag("Q3GnollsMixedNormal1");
        object oBase = GetObjectByTag("X0_TREASURE_HIGH");
        int nCount = 1;
        object oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, oBase, nCount);
        while (oGnoll != OBJECT_INVALID)
        {

            ChangeToStandardFaction(oGnoll, STANDARD_FACTION_HOSTILE);

            nCount = nCount + 1;
            oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, oBase, nCount);
        }


    }
    else if(nEvent == 103) // kobolds come to help
    {
        // first, check whether the kobolds should come
        if(GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") != 100)
            return;
        int nBetray = GetLocalInt(GetModule(), "Q3_KOBOLDS_BETRAYED");
        if(nBetray == 1)
            return; // player attacked the kobolds

        object oDoor = GetObjectByTag("Q3_SIDE1");
        if(oDoor == OBJECT_INVALID || GetLocalInt(oDoor, "OPEN") == 0)
            return; // door is closed -> kobolds can't come

        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KOBOLDS_HELP_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_KOBOLDS_HELP_ONCE", 1);

        object oWP = GetWaypointByTag("Q3A_WP_KOBOLDS_APPEAR");
        // next, destroy all un-armed kobolds in this area
        int i;
        object oKobold;
        for(i = 1; i <= 8; i++)
        {
            oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, oWP, i);
            if(oKobold == OBJECT_INVALID)
                break;
            DestroyObject(oKobold);
        }


        // now, create the armed bunch of kobolds at the specified WP
        object oNafeeli = CreateObject(OBJECT_TYPE_CREATURE, "q3_nafeeli", GetLocation(oWP));
        object oThug1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris1", GetLocation(oWP));
        object oThug2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris1", GetLocation(oWP));
        object oKobold1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris3", GetLocation(oWP));
        object oKobold2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris3", GetLocation(oWP));
        object oKobold3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris3", GetLocation(oWP));
        object oKobold4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris3", GetLocation(oWP));
        object oKobold5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_kobold_pris3", GetLocation(oWP));

        object oChief = GetObjectByTag("Q3_CHIEF_GISHNAK");
        if(oChief == OBJECT_INVALID)
            return;

        AdjustReputation(oNafeeli, oChief, -50);
        AdjustReputation(oChief, oNafeeli, -50);


        FightGnolls(oNafeeli);
        FightGnolls(oThug1);
        FightGnolls(oThug2);
        FightGnolls(oKobold1);
        FightGnolls(oKobold2);
        FightGnolls(oKobold3);
        FightGnolls(oKobold4);
        FightGnolls(oKobold5);
    }
    else if(nEvent == 104) // chief dies
    {
        object oBase = GetObjectByTag("X0_TREASURE_HIGH");
        int nCount = 1;
        object oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, oBase, nCount);
        while (oGnoll != OBJECT_INVALID)
        {

            SetCommandable(TRUE, oGnoll);
            ChangeToStandardFaction(oGnoll, STANDARD_FACTION_HOSTILE);

            nCount = nCount + 1;
            oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, oBase, nCount);
            AssignCommand(oGnoll, DetermineCombatRound());
        }
    }


}

