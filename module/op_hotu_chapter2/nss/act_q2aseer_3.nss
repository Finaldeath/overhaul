//::///////////////////////////////////////////////
//:: Name act_q2aseer_
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Launch the prelude to Wave 3 cutscene
    The Drow attack from the port
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave2Over",2);
    object oPC = GetPCSpeaker();
    //Variable for the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad",0);

    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
    SetLocalInt(OBJECT_SELF, "Q2B_CASTING", 1);
    ExecuteScript("cutscene110", oPC);
}
