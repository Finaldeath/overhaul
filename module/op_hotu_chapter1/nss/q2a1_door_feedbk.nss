//::///////////////////////////////////////////////
//:: q2a1_door_feedbk.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Tells the PC to rest if they have just leveled
   up and are trying to leave the room.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 3/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if (GetLocalInt(oPC, "X2_Q2ARestMessage") == 1)
    {
        if (GetXP(oPC) < 105000)
        {
            AssignCommand(oPC, ClearAllActions());
            DelayCommand(1.0, AssignCommand(oPC, ActionStartConversation(OBJECT_SELF, "bk_levelup", FALSE, FALSE)));
            return;
        }
        FloatingTextStrRefOnCreature(110119, oPC, FALSE);
        return;
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",8) ;
        SpeakOneLinerConversation();
        ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",0));
    }
}
