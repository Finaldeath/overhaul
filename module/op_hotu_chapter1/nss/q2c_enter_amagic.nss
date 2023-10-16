//::///////////////////////////////////////////////
//:: Anti Magic Trigger
//:: q2c_enter_amagic
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When any creature enters this area, it will no
    longer be able to cast magic of any kind.  To
    simulate this for now, we will use an immunity effect
    when a creature enters - until the anti-magic effect
    has been added.
    If the module level variable 'szAMField' is equal to
    whatever letter represents the triggered AntiMagicField,
    then that field has been deactivated.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 24, 2002
//:://////////////////////////////////////////////
void main()
{
    //Check to see if the module variable szAMField is equal to the
    //last letter in the trigger's tag (which should be A,B,C,D or E
    //If it is equal, then the field is activated, so apply anti magic effect
    //If it is not, then do nothing
    if (GetLocalInt(GetModule(),"X2_Q2C_AMField" + GetStringRight(GetTag(OBJECT_SELF),1)) == 1)
    {

        object oPC = GetEnteringObject();

        //Remove all current effects
        effect eRemEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eRemEffect) == TRUE)
        {
            RemoveEffect(oPC, eRemEffect);

            eRemEffect = GetNextEffect(oPC);

        }
        //Apply Antimagic effects
        effect eEffect1 = EffectVisualEffect(VFX_DUR_SPELLTURNING);
        effect eEffect2 = EffectSpellFailure();
        effect eLink = EffectLinkEffects(eEffect1, eEffect2);
        effect eEffect = SupernaturalEffect(eLink);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC);

        if (GetIsPC(oPC))
        {
            FloatingTextStrRefOnCreature(3796, oPC, FALSE);
        }
    }
    /*
    else
    {
        object oPC = GetEnteringObject();
        if (GetIsPC(oPC))
        {

            FloatingTextStrRefOnCreature(3797, oPC, FALSE);
        }
    }
    */
}

