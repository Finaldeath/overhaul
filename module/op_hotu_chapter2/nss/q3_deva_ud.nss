//:://////////////////////////////////////////////////
//:: X0_CH_HEN_USRDEF
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
 */
//:://////////////////////////////////////////////////
//:://////////////////////////////////////////////////

#include "x2c2_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if (nEvent == 20000 + ACTION_MODE_STEALTH)
    {
      int bStealth = GetActionMode(GetMaster(), ACTION_MODE_STEALTH);
      SetActionMode(OBJECT_SELF, ACTION_MODE_STEALTH, bStealth);
    }
    else
    if (nEvent == 20000 + ACTION_MODE_DETECT)
    {
      int bDetect = GetActionMode(GetMaster(), ACTION_MODE_DETECT);
      SetActionMode(OBJECT_SELF, ACTION_MODE_DETECT, bDetect);
    }
    else if(nEvent == 19767)
    {
        // Player death (as a master)
    }
    else if(nEvent == 1007) // dead
    {
        SetLocalInt(GetModule(), "bDevaDead", 1);
        AddJournalQuestEntry("q3_deva", 95, GetFirstPC(), TRUE, TRUE, TRUE);
    }
    else if(nEvent == 101) // to to player
    {
        object oPC = GetLocalObject(OBJECT_SELF, "PC");
        DelayCommand(4.0, ActionStartConversation(oPC));
    }
}
