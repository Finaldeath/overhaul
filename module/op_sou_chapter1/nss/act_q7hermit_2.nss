//::///////////////////////////////////////////////
//:: Name act_q7hermit_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC will settle his debt with the hermit and
    no longer be a penguin.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 31/03
//:://////////////////////////////////////////////
void RemovePenguinEffect(object oPC);
void main()
{
    object oPC = GetPCSpeaker();
    int nMoneyOwed = GetLocalInt(oPC, "X1_Q7ChargesToPayFor") * 100;
    if (GetGold(oPC) >= nMoneyOwed)
    {
        //Settle the PCs account
        TakeGoldFromCreature(nMoneyOwed, oPC);
        SetLocalInt(oPC, "X1_Q7ChargesToPayFor", 0);
        SetLocalInt(oPC, "X1_Q7_IMAPENGUIN", 0);
        //Unlock door
        object oDoor = GetObjectByTag("q7d_int_door");
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        //Remove the Polymorph if its on the PC
        int bPoly = FALSE;
        effect eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
            {
                bPoly = TRUE;

            }
            eEffect = GetNextEffect(oPC);

        }
        if (bPoly == TRUE)
        {
            ActionCastFakeSpellAtObject(SPELL_CURE_MODERATE_WOUNDS, oPC);
            DelayCommand(2.0, RemovePenguinEffect(oPC));

        }
    }
}

void RemovePenguinEffect(object oPC)
{
    effect ePoly = GetFirstEffect(oPC);
    while (GetIsEffectValid(ePoly) == TRUE)
    {
        if (GetEffectType(ePoly) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, ePoly);
        ePoly = GetNextEffect(oPC);
    }
}
