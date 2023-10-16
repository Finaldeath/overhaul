//::///////////////////////////////////////////////
//:: Name act_q2bgarg_str
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC must succeed in a Strength check (DC20) to
    successfully rotate the statues.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    if (d20() + GetAbilityScore(GetPCSpeaker(), ABILITY_STRENGTH) > 20)
        SetLocalInt(OBJECT_SELF, "nStrengthSucceed", 1);
    else
        SetLocalInt(OBJECT_SELF, "nStrengthSucceed", 0);

}
