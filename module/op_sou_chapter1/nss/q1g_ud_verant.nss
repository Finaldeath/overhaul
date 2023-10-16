//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1g_ud_verant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User Defined for Mayor Verant - set quest
    variable for Red Wizard Quest when mayor dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nFirstHB") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nFirstHB", 1);
            object oChair = GetObjectByTag("q1gmayorchair");
            AssignCommand(OBJECT_SELF, ActionSit(oChair));
        }
    }
    else if(nUser == 1007) // DEATH
    {
        //Set Quest Local for Thaymart quest to show that
        // the mayor is dead...
        if (GetLocalInt(OBJECT_SELF, "nDead") != 1)
        {
            SetLocalInt(GetModule(), "X1_HilltopMayorDead", 1);
            SetLocalInt(OBJECT_SELF, "nDead", 1);
            if (GetLocalInt(GetModule(), "X1_THAYQUEST") > 0)
                SetLocalInt(GetModule(), "X1_THAYQUEST", 80);
            //If killed by a PC - spawn in 4 guards and have them attack
            object oPC = GetLastHostileActor();
            if (GetIsPC(oPC) || GetMaster(oPC) != OBJECT_INVALID)
            {

                location lGuard1 = GetLocation(GetWaypointByTag("wp_q1g_gspawn1"));
                location lGuard2 = GetLocation(GetWaypointByTag("wp_q1g_gspawn2"));
                location lGuard3 = GetLocation(GetWaypointByTag("wp_q1g_gspawn3"));
                location lGuard4 = GetLocation(GetWaypointByTag("wp_q1g_gspawn4"));
                AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
                object oGuard1 = CreateObject(OBJECT_TYPE_CREATURE, "q1bguard", lGuard1);
                object oGuard2 = CreateObject(OBJECT_TYPE_CREATURE, "q1bguard", lGuard2);
                object oGuard3 = CreateObject(OBJECT_TYPE_CREATURE, "q1bguard", lGuard3);
                object oGuard4 = CreateObject(OBJECT_TYPE_CREATURE, "q1bguard", lGuard4);
                object oHaniah = GetObjectByTag("Haniah");
                SetIsTemporaryEnemy(oPC, oGuard1);
                SetIsTemporaryEnemy(oPC, oGuard2);
                SetIsTemporaryEnemy(oPC, oGuard3);
                SetIsTemporaryEnemy(oPC, oGuard4);
                if (GetMaster(oPC) != OBJECT_INVALID)
                {
                    object oMaster = GetMaster(oPC);
                    SetIsTemporaryEnemy(oMaster, oGuard1);
                    SetIsTemporaryEnemy(oMaster, oGuard2);
                    SetIsTemporaryEnemy(oMaster, oGuard3);
                    SetIsTemporaryEnemy(oMaster, oGuard4);
                    SetIsTemporaryEnemy(oMaster, oHaniah);
                }
                AssignCommand(oGuard1, ActionAttack(oPC));
                AssignCommand(oGuard2, ActionAttack(oPC));
                AssignCommand(oGuard3, ActionAttack(oPC));
                AssignCommand(oGuard4, ActionAttack(oPC));
                AssignCommand(oGuard4, ActionAttack(oHaniah));
            }
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

