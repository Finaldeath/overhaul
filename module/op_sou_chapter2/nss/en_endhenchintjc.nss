//::///////////////////////////////////////////////////////
// X0_EVT_TRIGGER
/*
  This is the OnEntered script for the henchman trigger objects.
  It signals the event router that a given event has occured,
  by obtaining the key tag from the trigger and using that as
  the event number.

  Each trigger will only be activated once, and can only be
  activated by a PC.


  MODIFIED BY BRENT, APRIL 2003
  1. Henchmen now trigger the trigger, not players
  2. Henchmen will only attempt to do the popup or intjereciton
      if the player and the henchmen meet he following requirements
        (a) Neither in combat
        (b) Neither in Conversation
        (c) Within 10 meters of each other
*/
//::///////////////////////////////////////////////////////

#include "x0_i0_common"
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, JumpToObject(oPC));
        AssignCommand(oHench, DelayCommand(0.1,ActionStartConversation(oPC)));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void main()
{  // SpawnScriptDebugger();
    object oTrigger = GetEnteringObject();
    int bIAmAnAssociate = FALSE;
    object oHench = GetHenchman(oTrigger);
    //Only valid if PC has a henchman
    if (GetIsObjectValid(oHench) == TRUE)
    {
        int bFoundAHench = TRUE;
    }
    else
    {
        return;
    }

    object oMaster = oTrigger;


    //SpawnScriptDebugger();
    // The key tag of the trigger is the module event number
    int MOD_EVENT_NUMBER = StringToInt(GetTrapKeyTag(OBJECT_SELF));


    string sTag = GetTag(OBJECT_SELF);
    int nStart = 0;
    int nCount = 4;
    string sSubTag = GetSubString(sTag, nStart, nCount);
    string sIntTag = GetSubString(sTag, 4, 10);
    string sNameDebug = GetName(oMaster);

    string sHenchTag = GetTag(oHench);
    if (ValidForInterjection(oMaster, oHench) && ValidForInterjection(oHench, oMaster))
    {

        // * one liners
        if (sSubTag != "INT_" && sTag != "Interjection")
        {
            AssignCommand(oHench, SetOneLiner(TRUE, MOD_EVENT_NUMBER));
            AssignCommand(oHench, SpeakOneLinerConversation("", oMaster));
            SetLocalInt(oHench, "X0_L_BUSY_SPEAKING_ONE_LINER", 10);
            // Only signal once
            DestroyObject(OBJECT_SELF);
            return;
        }
       // SpawnScriptDebugger();
        // interjections

        int bIsInCombat = FALSE;
        if (GetIsInCombat(oMaster) == TRUE)
        {
            bIsInCombat = TRUE;
        }


        // * Not in combat. The 'tag' of the trigger matches the henchman's tag
        if ( ((sSubTag == "INT_" &&  sIntTag == sHenchTag) || (sTag == "Interjection")) && bIsInCombat == FALSE)
        {
       // SpeakString("inter");

            // Interlude Specific
            // Don't display this interjection if the variable is not set but
            // do not destroy the trigger either.
            if (MOD_EVENT_NUMBER == 2)
            {
                int nVar = GetLocalInt(GetModule(),"Q5_TALKED_TO_GARRICK");
                if (nVar != 1)
                {
                    return;
                }
            }

            DoInterjection(oHench, oMaster, MOD_EVENT_NUMBER);
            // Only signal once
            DestroyObject(OBJECT_SELF);
        }
    }
    // * one liners
    if (sSubTag != "INT_" && sTag != "Interjection")
    {
        // * if the popup was unable to be displayed the first time, then
        // * too bad it won't ever get displayed.
        DestroyObject(OBJECT_SELF);
    }

}
