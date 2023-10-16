//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial 2, OnUse
//:: WW1_Mem2_OnUse.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Transfer any variables from the original
     Memorial stone for use on this one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oOriginalMemorial = GetObjectByTag("WW1_MemorialBoulder");

    //Fetch initial variable from this memorial
    int iBeginningX = GetLocalInt(OBJECT_SELF, "iBeginningComplete");

    //If the variables on this memorial have not yet been set...
    if (iBeginningX == 0)
    {
        //Fetch variables from original memorial
        int iBeginning = GetLocalInt(oOriginalMemorial, "iBeginningComplete");
        int iMiddle = GetLocalInt(oOriginalMemorial, "iMiddleComplete");
        int iEnd = GetLocalInt(oOriginalMemorial, "iEndComplete");
        string sResult = GetLocalString(oOriginalMemorial, "sWW_AbilityResult");

        //Apply them to current memorial
        SetLocalInt(OBJECT_SELF, "iBeginningComplete", iBeginning);
        SetLocalInt(OBJECT_SELF, "iMiddleComplete", iMiddle);
        SetLocalInt(OBJECT_SELF, "iEndComplete", iEnd);
        SetLocalString(OBJECT_SELF, "sWW_AbilityResult", sResult);
    }

    //Launch Conversation.
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
