//::///////////////////////////////////////////////
//:: Aribeth, Thaw (Action Script)
//:: H2a_Ari_Thaw.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thaws out Aribeth and has her launch her
     conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set the Thawed variable.
    object oAribeth = GetObjectByTag("H2_Aribeth");
    SetLocalInt(oAribeth, "bThawed", TRUE);
    SetLocalInt(GetModule(), "HX_ARIBETH_FIRE", TRUE);
    //Remove all effects on her.
    effect eEffect = GetFirstEffect(oAribeth);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oAribeth, eEffect);
        eEffect = GetNextEffect(oAribeth);
    }

    //Apply Ghost VFX.
    effect eSmoke = EffectVisualEffect(VFX_DUR_GHOST_SMOKE);
    effect eGhost = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSmoke, oAribeth);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oAribeth);

    //Launch conversation
    object oPC = GetPCSpeaker();
    AssignCommand(oAribeth, DelayCommand(2.0, ActionStartConversation(oPC)));
}
