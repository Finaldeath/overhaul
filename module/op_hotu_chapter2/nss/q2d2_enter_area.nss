//::///////////////////////////////////////////////
//:: Name q2d2_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of Zorvak'Mur - if the PC has attacked
    any illithids - everyone will be hostile.
    Set up any illusionary stuff at this time too..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"

void DestroyOldGladiators();

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //Check to see if the PC has entered into a deal with the brain.
    //if so - make sure all creatures are friendly again
    //The Illithids are only made friendly like this once...
    if (GetLocalInt(GetModule(),"elder_brain") > 1)
    {
        if (GetLocalInt(OBJECT_SELF, "X2_Q2DWorkingForBrain") == 0)
        {
            //Make sure the gone hostile script doesn't fire this time.
            SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 0);
            SetLocalInt(OBJECT_SELF, "X2_Q2DWorkingForBrain", 1);
            //Deactivate wandering monsters
            SetLocalString(OBJECT_SELF,"X2_WM_ENCOUNTERTABLE", "");

            //open the front gate
            object oGate = GetObjectByTag("q2d2_maingate");
            SetLocked(oGate, FALSE);
            AssignCommand(oGate, ActionOpenDoor(oGate));
            ExecuteScript("q2d2_allfriends", OBJECT_SELF);

        }
    }

    //When the PC returns from the Grand Hall - he has to get permission
    //to go back up from the hall guard.
    //SetLocalInt(GetModule(), "X2_Q2DPCClearedForHall", 0);

    //if the PC has made the illithid hostile.
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2DIllithidHostile", 2);
        //Activate Wandering Monsters
        object oArea = GetArea(OBJECT_SELF);
        SetLocalString(oArea,"X2_WM_ENCOUNTERTABLE", "ZorvakMur");

        ExecuteScript("q2d2_allhostile", OBJECT_SELF);
        //lock the main gate..
        object oGate = GetObjectByTag("q2d2_maingate");
        AssignCommand(oGate, ActionCloseDoor(oGate));
        SetLocked(oGate, TRUE);

    }

    //SLAVE REVOLT

    //if the Slave Revolt has been betrayed spawn in the dead gladiator slaves.
    if (GetLocalInt(GetModule(),"X2_Q2Dslave_betrayal") == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "nBetrayalSetup") == 1)
            return;
        DestroyOldGladiators();
        SetLocalInt(OBJECT_SELF, "nBetrayalSetup", 1);
        //if Evil - get a reward for stopping the slave revolt
        if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_EVIL)
            Reward_2daXP(oPC, 49);

        int nCount = 0;
        location lSpawn;
        for (nCount = 0; nCount < 8; nCount++)
        {
            lSpawn = GetLocation(GetObjectByTag("wp_q2d2gladcorpse", nCount));
            CreateObject(OBJECT_TYPE_PLACEABLE, "q2d2gladcorpse1", lSpawn);
        }
        lSpawn = GetLocation(GetWaypointByTag("wp_q2d2argohead"));
        CreateObject(OBJECT_TYPE_PLACEABLE, "q2d2_argohead", lSpawn);
        return;
    }
    //No revolt if the PC went back and attacked the Gladiators...
    if (GetLocalInt(GetModule(), "X2_Q2DGladsAttackedInPens") == 1)
        return;
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveUprising") == 2)
    {
        if (GetLocalInt(GetModule(), "nQ2DSlaveJournalAdded") != 1)
        {
            SetLocalInt(GetModule(), "nQ2DSlaveJournalAdded", 1);
            AddJournalQuestEntry("q2_slaverevolt",20,oPC);
            AddJournalQuestEntry("q2_zorvakmur",98,oPC,TRUE,TRUE,TRUE);
        }
        if (GetLocalInt(OBJECT_SELF, "nRevolt") != 1)
        {
            //XP Reward for starting the Revolt
            Reward_2daXP(oPC, 48);

            SetLocalInt(OBJECT_SELF, "nRevolt", 1);
            SetLocalInt(GetModule(), "X2_Revolt_Active", 1);
            //Destroy the Slaves down in the Pits if they were waiting there.
            DestroyOldGladiators();

            //Create Slaves and Mindflayers and start the attack..
            location lSlaveSpawn1 = GetLocation(GetWaypointByTag("wp_q2d2_freedslave_1"));
            location lSlaveSpawn2 = GetLocation(GetWaypointByTag("wp_q2d2_freedslave_2"));
            location lSlaveSpawn3 = GetLocation(GetWaypointByTag("wp_q2d2_freedslave_3"));
            location lSlaveSpawn4 = GetLocation(GetWaypointByTag("wp_q2d2_freedslave_4"));
            location lSlaveLeader = GetLocation(GetWaypointByTag("wp_q2d2_slaveleader"));
            location lMFSpawn1 = GetLocation(GetWaypointByTag("wp_q2d2_mfattacker_1"));
            location lMFSpawn2 = GetLocation(GetWaypointByTag("wp_q2d2_mfattacker_2"));
            location lMFSpawn3 = GetLocation(GetWaypointByTag("wp_q2d2_mfattacker_3"));
            location lMFSpawn4 = GetLocation(GetWaypointByTag("wp_q2d2_mfattacker_4"));

            //Create Rebellion
            object oSlave1 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave1", lSlaveSpawn1);
            object oSlave2 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave2", lSlaveSpawn1);
            object oSlave3 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave2", lSlaveSpawn2);
            object oSlave4 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave2", lSlaveSpawn2);
            object oSlave5 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave3", lSlaveSpawn3);
            object oSlave6 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave1", lSlaveSpawn3);
            object oSlave7 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave3", lSlaveSpawn4);
            object oSlave8 = CreateObject(OBJECT_TYPE_CREATURE, "q2dfreeslave2", lSlaveSpawn4);
            object oLeader = CreateObject(OBJECT_TYPE_CREATURE, "q2dslaveleader", lSlaveLeader);
            object oMF1 = CreateObject(OBJECT_TYPE_CREATURE, "X2_MINDFLAYER001", lMFSpawn1);
            object oMF2 = CreateObject(OBJECT_TYPE_CREATURE, "X2_MINDFLAYER001", lMFSpawn2);
            object oMF3 = CreateObject(OBJECT_TYPE_CREATURE, "X2_MINDFLAYER001", lMFSpawn3);
            object oMF4 = CreateObject(OBJECT_TYPE_CREATURE, "X2_MINDFLAYER001", lMFSpawn4);

            AssignCommand(oSlave1, DetermineCombatRound());
            AssignCommand(oSlave2, DetermineCombatRound());
            AssignCommand(oSlave3, DetermineCombatRound());
            AssignCommand(oSlave4, DetermineCombatRound());
            AssignCommand(oSlave5, DetermineCombatRound());
            AssignCommand(oSlave6, DetermineCombatRound());
            AssignCommand(oSlave7, DetermineCombatRound());
            AssignCommand(oSlave8, DetermineCombatRound());
            AssignCommand(oLeader, DetermineCombatRound());

            AssignCommand(oMF1, DetermineCombatRound());
            AssignCommand(oMF2, DetermineCombatRound());
            AssignCommand(oMF3, DetermineCombatRound());
            AssignCommand(oMF4, DetermineCombatRound());

        }
    }



}

void DestroyOldGladiators()
{
    object oLeader = GetObjectByTag("q2dslaveleader");
    object oArea = GetArea(oLeader);

    string szTag;
    object oThrall = GetFirstObjectInArea(oArea);
    while (oThrall != OBJECT_INVALID)
    {
        if (GetObjectType(oThrall) == OBJECT_TYPE_CREATURE)
        {
            szTag = GetTag(oThrall);
            if (GetStringLeft(szTag, 7) == "q2dthra" || szTag == "q2dslaveleader")
            {
                DestroyObject(oThrall);
            }

        }
        oThrall = GetNextObjectInArea(oArea);
    }

}
