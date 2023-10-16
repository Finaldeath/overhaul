//::///////////////////////////////////////////////
//:: Name q2a_ud_assassin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When the drow assassin is killed, set a variable
     that will fire Tamsil's Heartbeat script and
     set a local object so she knows who to talk to.


*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 30/02
//:://////////////////////////////////////////////

void main()
{

    if (GetUserDefinedEventNumber() == 1001)
    {
        //if (GetLocalInt(OBJECT_SELF, "nTalkedToPC") == 1)
        //    return;
        //object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        //ActionStartConversation(oPC);
    }
    else if (GetUserDefinedEventNumber() == 1007)
    {
        if (GetLocalInt(GetModule(), "X2_AssassinDead") != 1)
        {
            SetLocalInt(GetModule(), "X2_AssassinDead", 1);


            // * reenable the RELIC (September 2003 -- BK)
            SetLocalInt(GetModule(), "x2_g_disabled", 0);


            //Add Journal Entry for dreaming character
            object oHero;
            object oPlayer = GetFirstPC();
            while (oPlayer != OBJECT_INVALID)
            {
                if (GetLocalInt(oPlayer, "nPCNumber") == 1)
                    oHero = oPlayer;
                oPlayer = GetNextPC();
            }
            AddJournalQuestEntry("awakenings", 10, oHero, FALSE);

            SetLocalInt(oHero, "nAwakened", 10);  // for the treasure chest
            AssignCommand(oHero, ClearAllActions(TRUE));
            AssignCommand(oHero, ExecuteScript("q2a_starttam", oHero));




            //object oPC1 = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            //AssignCommand(oPC1, ClearAllActions(TRUE));






        }

    }
}
