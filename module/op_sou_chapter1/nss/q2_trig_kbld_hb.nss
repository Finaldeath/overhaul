//::///////////////////////////////////////////////
//:: Kobold room trigger heartbeat event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give the player a time equal to 2 heartbeats to sheath his weapon. Otherwise - attacking
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 7/2/2003
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetFirstPC();
    // checking for each player
    while(oPC != OBJECT_INVALID)
    {
        // only if the player is inside the room
        if(GetLocalInt(oPC, "Q2_IN_KOBOLD_ROOM") == 1)
        {
            int nHBInside = GetLocalInt(oPC, "Q2_HB_INSIDE");
            nHBInside++;
            SetLocalInt(oPC, "Q2_HB_INSIDE", nHBInside);
            // if not enough time in room - then ignore
            if(nHBInside < 2)
            {
                oPC = GetNextPC();
                continue;
            }
            // player got weapon in hand
            if(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC) != OBJECT_INVALID)
            {
                object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");
                object oKobold1 = GetNearestObjectByTag("q2_yazka"); //so affecting her faction too
                int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE1");
                if(nDoOnce == 1)
                   return;
                SetLocalInt(OBJECT_SELF, "DO_ONCE1", 1);
                SetLocalInt(oKobold, "Q2_WEAPON_DRAWN", 1);
                AssignCommand(oKobold, ActionMoveToObject(oPC, TRUE, 7.0));
                AssignCommand(oKobold, SpeakOneLinerConversation());
                AdjustReputation(oPC, oKobold, -100);
                AdjustReputation(oKobold, oPC, -100);

                //If PC is fighting for Yazka - don't adjust reputation
                if (GetLocalInt(oPC, "X1_Q2YAZKA_ALLY") != 1)
                {
                    AdjustReputation(oPC, oKobold1, -100);
                    AdjustReputation(oKobold1, oPC, -100);
                }

                AssignCommand(oKobold, ActionAttack(oPC));
                AssignCommand(oKobold, SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT));
                AssignCommand(oKobold, SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT));
                break;

            }
        }
        oPC = GetNextPC();
    }
}
