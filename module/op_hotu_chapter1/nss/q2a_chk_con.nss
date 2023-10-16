//::///////////////////////////////////////////////
//:: Name: q2a_chk_con
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do a constitution check on the player...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 24/03
//:://////////////////////////////////////////////


void main()
{
    if (GetAbilityScore(GetPCSpeaker(), ABILITY_CONSTITUTION) > 16)
        SetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT", 1);
    else if (GetAbilityScore(GetPCSpeaker(), ABILITY_CONSTITUTION) < 10)
        SetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT", 3);
    else
        SetLocalInt(GetPCSpeaker(), "X2_PROSTRESULT", 2);
}
