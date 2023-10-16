//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName: q1d_ud_cook
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //if the cook quest has not been completed.
        if (GetLocalInt(GetFirstPC(),"NW_JOURNAL_ENTRYq1dcook") <= 10)
        {
            //If the kobolds are leaving with the hostage
            if (GetLocalInt(GetModule(), "X1_COOKHOSTAGE") == 1)
            {//run to the exit
                object oExit = GetWaypointByTag("wp_q1d_exit");
                ActionMoveToObject(oExit, TRUE);
            }
        }
    }
           //if attacked or harmful spell cast at...
    else if(nUser == 1005 || (nUser == EVENT_SPELL_CAST_AT && GetLastSpellHarmful())) // ATTACKED
    {
        object oShaman = GetObjectByTag("q1dk_shaman");
        object oKobold1 = GetObjectByTag("q1dk_footpad1");
        object oKobold2 = GetObjectByTag("q1dk_footpad2");
        object oKobold3 = GetObjectByTag("q1dk_footpad3");
        object oKobold4 = GetObjectByTag("q1dk_footpad4");
        object oCook = GetObjectByTag("q1dcook");
        object oLodar = GetObjectByTag("q1dlodar");
        object oMob1 = GetObjectByTag("q1dmob1");
        object oMob2 = GetObjectByTag("q1dmob2");
        object oMob3 = GetObjectByTag("q1dmob3");
        object oMob4 = GetObjectByTag("q1dmob4");
        object oMob5 = GetObjectByTag("q1dmob5");
        object oMob6 = GetObjectByTag("q1dmob6");
        object oPC;
        if (nUser == 1005)
        {
            oPC = GetLastAttacker();
        }
        else
        {
            oPC = GetLastSpellCaster();
        }
        //If a commoner is being attacked before the kobolds have attacked.
        //set the commoners to hostile and leave the kobolds
        if (GetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED") != 1)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED", 1);
            SetLocalInt(GetModule(), "nCOMMONSATTACKED", 1);
            SetLocalInt(GetPCSpeaker(), "Lodar_Job", 7);

            ChangeToStandardFaction(oCook, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oLodar, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob1, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob2, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob3, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob4, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob5, STANDARD_FACTION_COMMONER);
            ChangeToStandardFaction(oMob6, STANDARD_FACTION_COMMONER);
            //Make the commoners hate the PC
            SetIsTemporaryEnemy(oPC, oCook);
            SetIsTemporaryEnemy(oPC, oLodar);
            SetIsTemporaryEnemy(oPC, oMob1);
            SetIsTemporaryEnemy(oPC, oMob2);
            SetIsTemporaryEnemy(oPC, oMob3);
            SetIsTemporaryEnemy(oPC, oMob4);
            SetIsTemporaryEnemy(oPC, oMob5);
            SetIsTemporaryEnemy(oPC, oMob6);
            //The kobolds will seize the opportunity to kill the cook
            SetIsTemporaryEnemy(oCook, oShaman);
            SetIsTemporaryEnemy(oCook, oKobold1);
            SetIsTemporaryEnemy(oCook, oKobold2);
            SetIsTemporaryEnemy(oCook, oKobold3);
            SetIsTemporaryEnemy(oCook, oKobold4);
            //Freeze the cook so that she stops running
            DelayCommand(2.0, AssignCommand(oCook, ClearAllActions(TRUE)));

        }
    }

    else if(nUser == 1007) // DEATH
    {
        if (GetLocalInt(OBJECT_SELF, "nDied") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDied", 1);
            SetLocalInt(GetModule(), "Captive_Cook", 2);

            AddJournalQuestEntry("q1dcook", 20, GetFirstPC(), TRUE, TRUE);
        }
    }
    else if(nUser == 1100) // Destroyed by Trigger
    {
        AddJournalQuestEntry("q1dcook", 40, GetFirstPC(), TRUE, TRUE);
        SetLocalInt(GetModule(), "Captive_Cook", 1);
    }

}


