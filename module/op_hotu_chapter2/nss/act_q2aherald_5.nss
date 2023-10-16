//::///////////////////////////////////////////////
//:: Name  act_q2aherald_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle 2 - now happens in waves.
    Wave 1 would have been the House Maeviir betrayal
    Wave 2 - If the PC lost Battle 1 (at the gates),
    then Wave 2 will be an attack by Duergar and Bone Golems
    from that direction, if the PC won Battle 1,
    Wave 3 will commence - attack by Drow forces.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: September 5/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nBattle2Wave2Started") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nBattle2Wave2Started", 1);

    object oPC = GetPCSpeaker();
    //Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 0);
    //Remove immobalize effect from PC (from end of battle conversation)
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
    //if Battle 1 was lost - go to cutscene 109 (Duergar)
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Lost") == 1)
        ExecuteScript("cutscene109", oPC);
    //else go to cutscene 110
    else
        ExecuteScript("cutscene110", oPC);
}
