//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker End of Conversation
//:: WW1_Ragp_End.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets a local on the player, indicating that
    they've completed the Ragpicker's
    conversation. Make sure they're now
    Commandable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oRagpicker = GetNearestObjectByTag("Ragpicker");
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");

    //Flag the player as having completed the conversation.
    SetLocalInt(oPC, "CONV_RAGPICKER_End", TRUE);

    //If the player attempted to Intimidate the Ragpicker in the first
    //conversation, transfer that variable over to the real Ragpicker for any
    //subsequent conversations.
    if (sResult != "")
    {
        SetLocalString(oRagpicker, "sWW_AbilityResult", sResult);
    }

    //Destroy Invisible Object
    DestroyObject(OBJECT_SELF, 2.0);

    //Destroy the clone
    object oClone2 = GetLocalObject(oPC, "oCut2_Clone");
    DestroyObject(oClone2, 1.0);

    //Remove cutscene invisibility
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        int iEffectType = GetEffectType(eEffect);
        if (iEffectType == EFFECT_TYPE_VISUALEFFECT)
        {
            DelayCommand(1.0, RemoveEffect(oPC, eEffect));
        }
        eEffect = GetNextEffect(oPC);
    }

    //End Cutscene Mode in such a way that the transition is seamless.
    AssignCommand(oPC, StoreCameraFacing());
    DelayCommand(1.1, SetCutsceneMode(oPC, FALSE));
    DelayCommand(1.1, AssignCommand(oPC, RestoreCameraFacing()));
}
