//::///////////////////////////////////////////////
//:: Anti Magic Trigger
//:: q2c_exit_amagic
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When any creature exits this area, it will have its
    anti magic effects removed.  Spell casting should be
    possible again.
    To simulate this for now, we will use an immunity effect
    when a creature enters - until the anti-magic effect
    has been added
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Septermber 24, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"X2_Q2C_AMField" + GetStringRight(GetTag(OBJECT_SELF),1)) == 1)
    {

        object oPC = GetExitingObject();
        object oLever1 = GetObjectByTag("q2c_lever1");
        object oLever2 = GetObjectByTag("q2c_lever2");
        object oLever3 = GetObjectByTag("q2c_lever3");
        object oLever4 = GetObjectByTag("q2c_lever4");
        object oLever5 = GetObjectByTag("q2c_lever5");
        object oTrigger1 = GetObjectByTag("AntiMagicAreaA");
        object oTrigger2 = GetObjectByTag("AntiMagicAreaB");
        object oTrigger3 = GetObjectByTag("AntiMagicAreaC");
        object oTrigger4 = GetObjectByTag("AntiMagicAreaD");
        object oTrigger5 = GetObjectByTag("AntiMagicAreaE");

        effect eEffect = GetFirstEffect(oPC);

        //remove effect if it was created by this trigger
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            //if the effect creator was the trigger or any of the five levers then remove the effect
            if (GetEffectCreator(eEffect) == OBJECT_SELF || GetEffectCreator(eEffect) == oLever1 || GetEffectCreator(eEffect) == oLever2 || GetEffectCreator(eEffect) == oLever3 || GetEffectCreator(eEffect) == oLever4 || GetEffectCreator(eEffect) == oLever5
                || GetEffectCreator(eEffect) == oTrigger1 || GetEffectCreator(eEffect) == oTrigger2 || GetEffectCreator(eEffect) == oTrigger3 || GetEffectCreator(eEffect) == oTrigger4 || GetEffectCreator(eEffect) == oTrigger5)
            {
                    RemoveEffect(oPC, eEffect);
            }
            eEffect = GetNextEffect(oPC);


        }
        /*
        if (GetIsPC(oPC))
        {
            FloatingTextStrRefOnCreature(3798, oPC, FALSE);
        }
        */
    }

    else
    {

        object oPC = GetExitingObject();
        object oLever1 = GetObjectByTag("q2c_lever1");
        object oLever2 = GetObjectByTag("q2c_lever2");
        object oLever3 = GetObjectByTag("q2c_lever3");
        object oLever4 = GetObjectByTag("q2c_lever4");
        object oLever5 = GetObjectByTag("q2c_lever5");
        object oTrigger1 = GetObjectByTag("AntiMagicAreaA");
        object oTrigger2 = GetObjectByTag("AntiMagicAreaB");
        object oTrigger3 = GetObjectByTag("AntiMagicAreaC");
        object oTrigger4 = GetObjectByTag("AntiMagicAreaD");
        object oTrigger5 = GetObjectByTag("AntiMagicAreaE");

        effect eEffect = GetFirstEffect(oPC);

        //remove effect if it was created by this trigger
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            //if the effect creator was the trigger or any of the five levers then remove the effect
            if (GetEffectCreator(eEffect) == OBJECT_SELF || GetEffectCreator(eEffect) == oLever1 || GetEffectCreator(eEffect) == oLever2 || GetEffectCreator(eEffect) == oLever3 || GetEffectCreator(eEffect) == oLever4 || GetEffectCreator(eEffect) == oLever5
                || GetEffectCreator(eEffect) == oTrigger1 || GetEffectCreator(eEffect) == oTrigger2 || GetEffectCreator(eEffect) == oTrigger3 || GetEffectCreator(eEffect) == oTrigger4 || GetEffectCreator(eEffect) == oTrigger5)
            {
                    RemoveEffect(oPC, eEffect);


            }
            eEffect = GetNextEffect(oPC);


        }



    }

}
