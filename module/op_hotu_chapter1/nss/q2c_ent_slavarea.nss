//::///////////////////////////////////////////////
//:: Name q2c_ent_slavarea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter, the 'slave' leader will start
    conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 4/03
//:://////////////////////////////////////////////
#include "X2_inc_itemprop"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTransformed") == 1)
        return;

    object oPC = GetEnteringObject();

    //True Sight Check

    //Area
    object oArea = GetArea(oPC);

    //Have the Rakshasa already transformed
    if (GetLocalInt(oArea, "X2_RakTransformed") == 1)
        return;

    int bTransform = FALSE;
    //Check for the truesight property on the equipped item
    //if it has it - transform the rakshasa
    if (IPGetHasItemPropertyOnCharacter(oPC, ITEM_PROPERTY_TRUE_SEEING) == TRUE)
    {
        bTransform = TRUE;
    }

    if (bTransform == FALSE)
    {
        //If the PC has true sight cast on themselves - the Rakshasa transform,
        //otherwise Shareesh will init with the PC
        effect eTrueSight = GetFirstEffect(oPC);
        while(GetIsEffectValid(eTrueSight) == TRUE)
        {
            if (GetEffectSpellId(eTrueSight) == SPELL_TRUE_SEEING)
            {
                bTransform = TRUE;
            }

            eTrueSight = GetNextEffect(oPC);
        }
    }

    if (bTransform == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTransformed", 1);

        ExecuteScript("act_q2rakattack", oArea);
    }

    //if the PC enters while still in combat and the rakshasa haven't transformed
    //Shareesh will run away from the PC
    //other wise Shareesh will talk to the PC
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;


    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oSlave = GetObjectByTag("q2crakslaveleader");
        if (GetIsInCombat(oPC) == TRUE)
        {
            AssignCommand(oSlave, ActionMoveAwayFromObject(oPC, TRUE, 10.0));
        }
        else
        {
            AssignCommand(oSlave, ActionStartConversation(oPC));
        }
    }
}
